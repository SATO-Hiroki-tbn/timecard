class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_action :user_profile_not_regist, only: [:new]
  # before_action :attendances_not_regist
  # GET /attendances
  # GET /attendances.json
  def index
     @attendances = Attendance.order(work_date: :desc)
   
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @work_date = params[:work_date] ? Date.parse(params[:work_date]) : Date.today
    recent_project, project_place = Attendance.recent_project(current_user)

    @attendance = Attendance.new(project_name: recent_project, place: project_place,
      user_id: current_user.id, work_date: Date.today, in_time: current_user.user_profile.try(:in_regular),
      out_time: current_user.user_profile.try(:out_regular))
    # @attendances = Attendance.all
    @attendances = Attendance.find_in_month(current_user, @work_date )
    #@tasks_grid = initialize_grid(Attendance)
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to new_attendance_path(work_date: @attendance.work_date), notice: 'Attendance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendance }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to new_attendance_path(work_date: @attendance.work_date), notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to new_attendance_path }
      format.json { head :no_content }
    end
  end

  def  export_csv
      send_data Attendance.to_csv(current_user, params[:work_date]), filename: "#{params[:work_date]}.csv"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def user_profile_not_regist
      return if current_user.user_profile
      redirect_to new_user_profile_path(current_user)
    end

    # def attendances_not_regist
    #   return if current_user.attendance.user_id
    #   @attendance = Attendance.new(user_id: current_user.id, work_date: Date.today, in_time: current_user.user_profile.try(:in_regular),
    #   out_time: current_user.user_profile.try(:out_regular))
    #   @attendances = Attendance.find_in_month(current_user, @work_date)
    #   redirect_to new_attendance_path(@attendance, @attendances)
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :work_date, :in_time, :out_time, :project_name, :place, :description)
    end
end
