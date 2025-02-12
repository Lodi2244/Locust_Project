class GigsController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@attendances = Attendance.all
	end

  def show
		@gig = Gig.find(params[:id])
<<<<<<< HEAD
		@attendance = Attendance.find(params[:id])
=======
		@current_user = current_user
		#@attendance = Attendance.where("current_user.id => current_user.id && gig_id => @gig.id")
>>>>>>> 50574f1ebc5915f58d924f105aaa1369f3fcd56c
  end

	def new
	  @gig = Gig.new
	  @tags = Tag.all
	end

  	def create
			@gig = Gig.new(post_params)


			if @gig.save
				redirect_to bar_path(@gig.bar_id)
			else
				redirect_to root_path
			end
		end


	private

	  def authenticate_user
	    unless current_user
	      flash[:danger] = "Connectez-vous pour avoir accès à cette fonctionnalité !"
	      redirect_to new_session_path
	    end
		end

		def is_admin
			@gig = Gig.find(params[:id])
			unless user_signed_in? && current.user.role === 'admin'
				flash[:danger] = "Vous ne pouvez pas accéder à cette page"
				redirect_to root_path
			end
		end

		def post_params
			params.require(:gig).permit(:name, :bar_id, :date)
		end


end
