class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :counter]
  skip_before_action :authenticate_user!
  layout 'sub_show', :only => [:show]

  impressionist :actions => [:show]

  def index
    @most_actioned = Submission.link_clicks_desc
    # @most_viewed = Submission.most_viewed
    @most_recent = Submission.most_recent
    @charities = Charity.all

    if params[:most_recent]
      @submissions = @most_recent
    else
      @submissions = @most_actioned
    end
  end

  def show
    @charity_id = params[:charity_id]
    impressionist(@submission)
  end

  def counter
    @submission.increment! :link_clicks, 1
    current_user.increment! :actions_taken, 1 if current_user
    redirect_to new_user_registration_path
  end

  def edit
    @charities = Charity.all
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
        # format.json { render :show, status: :created, location: @submission }
      else
        # Not sure when exactly this triggers
        redirect_to :back
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
      format.html { redirect_to admin_index_path, notice: 'Submission was successfully destroyed.' }
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
