class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@book_new = Book.new
	end

	def edit
		@user_check = User.find(params[:id])
		if current_user.id == @user_check.id
			@user = current_user
		else
			redirect_to user_path(current_user.id)
		end
	end

	def update
		@user = current_user
		if @user.update(user_params)
		redirect_to user_path(@user.id), notice: "User was successfully updated"
		else
		render :action => "edit"
		end
	end

	def index
		@book_new = Book.new
	    @users = User.all
	end

	private

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
