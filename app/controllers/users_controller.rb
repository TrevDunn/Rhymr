class UsersController < ApplicationController

	# Authorization						#RM index later
	before_action :authorize, except: [:index, :new, :create]

	# Routes
	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def create
		user = User.new(user_params)
		if user.save
			redirect_to ('/login')
		else
			redirect_to ('/users/new')
		end
	end
	def update
		id = params[:id]
		user = User.find(id)
		if user.update(user_params)
			redirect_to user_path(user)
		else
			redirect_to user_limericks_path
		end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session[:user_id] = nil
		redirect_to login_path
	end

	private
	def user_params
		params.require(:user).permit(
		:name,
		:email
		:password,
		:password_confirmation
		)
	end

end
