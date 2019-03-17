class AttendancesController < ApplicationController
  #before_action :authenticate_user, only: [:new, :create, :destroy]

	def index
		@attendances = Attendance.all
	end

	def new
    # @gig = Gig.find(params[:id])
	  # @attendance = Attendance.new(post_params)
    # respond_to do |format|
    #   format.html { redirect_to gig_path(@gig), notice: 'Your participation was successfully saved' }
    #   format.json { render :show, status: :ok, location: @gig }
    # end
	 end

  def create
		@attendance = Attendance.new(post_params)
		@gig = Attendance.find(params[:gig_id])

		if
			@attendance.save
      respond_to do |format|
        format.html { redirect_back fallback_location: @gig, notice: 'Your participation was successfully saved' }
        format.json { render :show, status: :ok, location: @gig }
      end

		 else
        redirect_to root_path
        flash[:danger] = "Oups !"
        puts @attendance.errors.full_messages
	 	 end
  end

  def destroy

		@attendance = Attendance.last
		@attendance_id = @attendance.id
		@attendance.destroy!
    respond_to do |format|
      format.html { redirect_back fallback_location: @gig, notice: 'Your participation was successfully cancelled' }
      format.json { render :show, status: :ok, location: @gig }
    end
  end

  private

  def post_params
    params.permit(:user_id, :gig_id)
  end

end
