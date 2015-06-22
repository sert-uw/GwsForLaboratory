class TimetablesController < ApplicationController
  before_action :load_timetable, only: [:index]
  before_action :set_timetable, only: [:show, :edit, :update]

  def index
  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
  end

  # GET /timetables/1/edit
  def edit
  end

  # PATCH/PUT /timetables/1
  # PATCH/PUT /timetables/1.json
  def update
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to @timetable, notice: 'Timetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @timetable }
      else
        format.html { render :edit }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_params
      params.require(:timetable).permit(:user_id)
    end

    def load_timetable
      timetable = Timetable.find_by(user_id: current_user.id)

      unless timetable.present?
        timetable = Timetable.create(user_id: current_user.id)
      end

      redirect_to timetable_path(timetable)
    end
end
