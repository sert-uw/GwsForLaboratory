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
    timetable_params.each do |param|
      item = @timetable.items.find(param[0])
      param[1].each do |idx|
        item[idx.to_s] = true
      end
      item.save
    end

    respond_to do |format|
        format.html { redirect_to @timetable, notice: t('notice.timetable.update') }
        format.json { render :show, status: :ok, location: @timetable }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_params
      params.require(:items)
    end

    def load_timetable
      #timetable = Timetable.find_by(user_id: current_user.id)

      unless current_user.timetable.present?
        current_user.timetable = Timetable.create(user_id: current_user.id)
        current_user.save
      end

      redirect_to timetable_path(current_user.timetable)
    end
end
