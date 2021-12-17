class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /jobs or /jobs.json
  def index
    user_signed_in? ? @jobs = current_user.jobs : @jobs = Job.none
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @user = current_user
    @job = @user.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to "/", notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to "/", notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def quick_add
    if params[:url].start_with?("https://www.linkedin.com")
      @job = Job.new(title: "LinkedIn Job Posting", url: params[:url], submission_date: Date.today)
      render :new
      return
    end
    if params[:url].present? && !params[:url].start_with?("https://")
      if params[:url].start_with?("http://")
        params[:url] = params[:url].sub("http://", "https://")
      else
        params[:url] = "https://" + params[:url]
      end
    end
    result = Mechanize.new.get(params[:url])
    @job = Job.new(title: result.title, url: params[:url], submission_date: Date.today)
    render :new
  rescue => e
    redirect_to "/", alert: "Invalid URL. Error: #{e}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:company, :title, :url, :cover_letter_url, :resume_url, :submission_date, :notes, :response_date, :status, {})
  end
end
