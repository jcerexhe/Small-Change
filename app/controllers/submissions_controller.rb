class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :counter]
  skip_before_action :authenticate_user!
  layout 'sub_show', :only => [:show]

  def index
    @submissions = Submission.link_clicks_desc
    @charities = Charity.all
  end

  def show
    @charities = Charity.all
    @submissions = Submission.all
    @submission = Submission.friendly.find(params[:submission]) if params[:submission]
  end

  def counter
    @submission.increment! :link_clicks, 1
    redirect_to new_user_registration_path
  end

  def edit 
    @charities = Charity.all
  end

  def create
    @submission = Submission.new(submission_params)
    @existing_submission = Submission.friendly.find_by(url: @submission.url)
   
    # @user = current_user

    if @existing_submission         #if this is the first time
      @existing_submission.users << current_user if current_user
      redirect_to submission_path(@existing_submission) 
    else
      if @submission.url.include? "youtube.com"
          object = VideoInfo.new(@submission.url)
          video = LinkThumbnailer.generate(@submission.url)                             #if this is not the first time 
          @submission.users << current_user if current_user
          @submission.title = video.title
          @submission.favicon = 'https://upload.wikimedia.org/wikipedia/commons/0/06/YouTube_logo_2013.svg'
          @submission.description = video.description
          @submission.image = object.thumbnail_large
          @submission.url = object.embed_url
          @submission.youtube = true

      else
          object = LinkThumbnailer.generate(@submission.url)                             #if this is not the first time 
          @submission.users << current_user if current_user
          @submission.title = object.title
          @submission.favicon = object.favicon
          @submission.description = object.description
          @submission.image = object.images.first.src.to_s if object.images.first
      end

      if @submission.url.include? "skynews.com"
        @submission.favicon = "https://lh3.googleusercontent.com/-uYnyeu0wFpQ/AAAAAAAAAAI/AAAAAAAAe8k/uwcJE42X16E/s0-c-k-no-ns/photo.jpg"
      end

      if @submission.url.include? "sbs.com"
        @submission.favicon = "https://pbs.twimg.com/profile_images/434661068011339776/q5OHXv0Q.jpeg"
      end

      if @submission.url.include? "/wp-content/themes/wp-inspired-prem/images/favicon.ico"
        @submission.favicon = "https://i.vimeocdn.com/portrait/432427_300x300.jpg"
      end

      if @submission.url.include? "aljazeera.com"
        @submission.favicon = "http://www.freelogovectors.net/wp-content/uploads/2012/04/al-jazeera-logo.jpg"
      end
    
      if @submission.save
          redirect_to submissiontype_path(submission: @submission.id)
        # format.json { render :show, status: :created, location: @submission }
      else
        render :new
        # format.json { render json: @submission.errors, status: :unprocessable_entity }
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
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_submission
      @submission = Submission.friendly.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:url, :user_id, :charity_id, :cause_id, :origin, :charity, :youtube, :submission_type, :charity_link, :petition_link, :link_clicks, :slug)
    end
end
