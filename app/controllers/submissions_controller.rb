class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
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
    object = LinkThumbnailer.generate(@submission.url)
    # @user = current_user
    if params[:charity]
      @charity = Charity.find(params[:charity])
    end
     
    if @existing_submission         #if this is the first time
      @existing_submission.users << current_user
      if params[:charity]
        @existing_submission.charities << @charity
        redirect_to new_donation_path(charity: @charity.id, submission: @existing_submission.id)
      else
        redirect_to choose_charity_path(submission: @existing_submission.id)
      end
    else                                #if this is not the first time 
      @submission.users << current_user
      @submission.title = object.title
      @submission.favicon = object.favicon
      @submission.description = object.description
      @submission.image = object.images.first.src.to_s if object.images.first
    
      if @submission.save
        if params[:charity]
          @submission.charities << @charity
          redirect_to new_donation_path(charity: @charity.id, submission: @submission.id)
        else
          redirect_to choose_charity_path(submission: @submission.id)
        end
        
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
      params.require(:submission).permit(:url, :user_id, :charity_id, :cause_id, :origin)
    end
end
