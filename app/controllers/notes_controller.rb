class NotesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @note = @job.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to '/', notice: "Note was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def note_params
    params.permit(:content)
  end
end
