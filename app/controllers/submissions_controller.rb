class SubmissionsController < ApplicationController
  # before_action :require_login
  # before_filter :authenticate_user!, only: [:index, :destroy]
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :accept, :reject, :hold]
  has_scope :status
  # GET /submissions
  # GET /submissions.json
    before_action :require_login

private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end


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
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)
    respond_to do |format|
      if @submission.save
        SubmissionMailer.submission_email(@submission).deliver_later
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
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
  
  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  

def accept
  respond_to do |format|
    if @submission.update_attribute(:status, "accepted")
      DecisionMailer.acceptance_email(@submission).deliver_later
      format.html { redirect_to submissions_url, notice: 'Submission was successfully updated.' }
      format.json { render :index, status: :ok, location: @submission }
    else
      format.html { render :edit }
      format.json { render json: @submission.errors, status: :unprocessable_entity }
    end
  end
end
  
def reject
  respond_to do |format|
    if @submission.update_attribute(:status, "rejected")
      DecisionMailer.rejection_email(@submission).deliver_later
      format.html { redirect_to submissions_url, notice: 'Submission was successfully updated.' }
      format.json { render :index, status: :ok, location: @submission }
    else
      format.html { render :edit }
      format.json { render json: @submission.errors, status: :unprocessable_entity }
    end
  end
end

def hold
  respond_to do |format|
    if @submission.update_attribute(:status, "on hold")
      DecisionMailer.hold_email(@submission).deliver_later
      format.html { redirect_to submissions_url, notice: 'Submission was successfully updated.' }
      format.json { render :index, status: :ok, location: @submission }
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
      params.require(:submission).permit(:name, :email, :submission, :coverletter, :time, :status)
    end
end
