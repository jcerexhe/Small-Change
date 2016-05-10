class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :counter, :ball_rolling_payment]
  skip_before_action :authenticate_user!
  layout 'sub_show', :only => [:show]
  impressionist :actions => [:show]

  def index
    # Delete all submissions that are not connected to a charity or petition (and are more than 10 mins old)
    Submission.all.each do |submission|
      if !submission.petition_link.present? && !submission.charity_category_id.present? && Time.now - submission.created_at > 600
        submission.destroy
      end
    end
    @most_actioned = Submission.link_clicks_desc
    @most_recent = Submission.most_recent
    @charities = Charity.all
    @donations = Donation.all
    if params[:most_recent]
      @submissions = @most_recent
    else
      @submissions = @most_actioned
    end
  end

  def strip_url(uri)
    url = URI(uri).host
    url.sub!(/www./, '') if url.include? "www."
    return url
  end

  def show
    require 'httparty'
    require 'nokogiri'
    require 'json'
    require 'pry'
    require 'csv'

    # Providers that won't be iframed
    iframe_deniers = ["theguardian.", "ted.com", "vimeo.com", "nytimes.com"  ]

    iframe_deniers.each do |text|
      if @submission.url.include?(text)
        puts "@iframe_denied = true" * 5
        @iframe_denied = true
        page = HTTParty.get(@submission.url)
        parse_page = Nokogiri::HTML(page)
        @p_array = []
        parse_page.css('p').map do |a|
          paragraph = a.text
          @p_array.push(paragraph)
        end
        # end scraping
        # Remove unwanted words from scrape
        blacklisted_words = ["Advertisement", "Ad", "Comment", "Sign in"]
        removed_paragraphs = []

        @p_array.each do |paragraph|
          blacklisted_words.each do |word|
            if paragraph.include?(word)
              removed_paragraphs << paragraph
            end
          end
        end
        @p_array = @p_array - removed_paragraphs
        break
      else
        @iframe_denied = false
      end
    end
    impressionist(@submission)
    @amount = Donation.where(submission_id: @submission.id).sum(:amount).to_i / 100
    if @amount < 2
      @donation_amount_title = "Toss em' a coin"
    else
      @donation_amount_title = "$" + @amount.to_s + " small changed already"
    end
    @charity_category = CharityCategory.find(@submission.charity_category_id) if @submission.charity_category_id
    @charity = Charity.find(@charity_category.charity_id) if @submission.charity_category_id
    if Submission.friendly.find(params[:id]).user_id.present?
      if User.find(Submission.friendly.find(params[:id]).user_id).present?
        @name = User.find(Submission.friendly.find(params[:id]).user_id).first_name + " " + User.find(Submission.friendly.find(params[:id]).user_id).last_name
      end
    end
    if @submission.url.include?("youtube")
      @source=""
    else
      @source = strip_url(@submission.url) + " | "
    end
  end

  def counter
    if !user_signed_in?
      @submission.increment! :link_clicks, 1
    elsif user_signed_in? && !current_user.admin
        @submission.increment! :link_clicks, 1
    end    
    current_user.increment! :actions_taken, 1 if current_user
    redirect_to new_user_registration_path(action_taker: true)
  end

  def ball_rolling_payment
    @submission.increment! :link_clicks, 1
    current_user.increment! :actions_taken, 1 if current_user
    redirect_to :back
  end

  def edit
    @charities = Charity.all
    @charity_categories = CharityCategory.where(charity_id: params[:charity_id])
    @charity = Charity.find(params[:charity_id]) if params[:charity_id]
  end

  def create
    @submission = Submission.new(submission_params)
    @existing_submission = Submission.friendly.find_by(url: @submission.url)

    if @existing_submission         #if this is the first time
      redirect_to submission_path(@existing_submission, existing: true)
    else
      if @submission.url.include? "youtube.com"
          object = VideoInfo.new(@submission.url)
          video = LinkThumbnailer.generate(@submission.url)                             #if this is not the first time
          @submission.user = current_user if current_user
          @submission.title = video.title
          @submission.favicon = 'https://upload.wikimedia.org/wikipedia/commons/0/06/YouTube_logo_2013.svg'
          @submission.description = video.description
          @submission.image = object.thumbnail_large
          @submission.url = object.embed_url
          @submission.youtube = true

      else
          object = LinkThumbnailer.generate(@submission.url)                             #if this is not the first time
          @submission.user = current_user if current_user
          @submission.title = object.title
          @submission.favicon = object.favicon
          @submission.description = object.description
          @submission.image = object.images.first.src.to_s if object.images.first
      end

      if @submission.save
        redirect_to submissiontype_path(submission: @submission.id)
      else
        redirect_to :back
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_submission
      @submission = Submission.friendly.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:url, :user_id, :cause_id, :origin, :charity, :charity_category_id, :submission_type, :charity_link, :petition_link, :link_clicks, :slug, :youtube)
    end
end
