class LimericksController < ApplicationController

	def all
		@limericks = Limerick.all
		# @user_name = User.where(:user_id => @limericks.id)

	end
	def index
		@user = User.find(params[:user_id])
		@limericks = @user.limericks
	end
	def new
		@limerick = Limerick.new
	end
	def show
		@limerick = Limerick.find(params[:id])
	end
	def create
		@limerick = Limerick.new
		@limerick.title = params[:limerick][:title]
		@limerick.content = params[:limerick][:content]
		@limerick.user_id = current_user.id
		@limerick.save

		redirect_to limericks_path
	end
	def update
		limerick = Limerick.find(params[:limerick_id])
		if limerick.update(limerick_params)
			redirect_to user_limericks_path
		else
			redirect_to user_limericks_path
		end
	end
	def destroy
		@limerick = Limerick.find(params[:id])
		@limerick.destroy
		redirect_to user_path
	end

	private
	def limerick_params
		params.require(:limerick).permit(
			:title,
			:content
		)
	end
end
