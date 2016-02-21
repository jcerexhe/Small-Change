class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  # GET /submissions
  # GET /submissions.json
  def index
  @submissions = Submission.all
  @charities = Charity.all
  end

  

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @charities = Charity.all
    @submissions = Submission.all
    @submission = Submission.find(params[:submission]) if params[:submission]
  end

    def counter
      if params[:submission]
        @submission = Submission.find(params[:submission])
        if @submission.link_clicks == nil
          @submission.link_clicks = 1
        end
        @submission.link_clicks = @submission.link_clicks + 1
      end
    end

  

  # GET /submissions/new
  def new
    @submission = Submission.new
    @user = current_user
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    
      @submission = Submission.new(submission_params)
      @existing_submission = Submission.find_by(url: @submission.url)
     
      # @user = current_user

      if @existing_submission         #if this is the first time
        @existing_submission.users << current_user if current_user
        redirect_to choose_charity_path(submission: @existing_submission.id) 
      else
          if @submission.url.include? "youtube.com"
              object = VideoInfo.new(@submission.url)
              video = LinkThumbnailer.generate(@submission.url)                             #if this is not the first time 
              @submission.users << current_user if current_user
              @submission.title = video.title
              @submission.favicon = 'https://upload.wikimedia.org/wikipedia/commons/0/06/YouTube_logo_2013.svg'
              @submission.description = video.description
              @submission.image = object.thumbnail_medium
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

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
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

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:url, :user_id, :charity_id, :cause_id, :origin, :charity, :youtube, :submission_type, :charity_link, :petition_link, :link_clicks)
    end
end
