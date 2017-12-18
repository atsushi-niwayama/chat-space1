class GroupsController < ApplicationController
    before_action :login_check

  def index
	 @groups = current_user.groups
  end

	def new
		@group =Group.new
	end

	def create
	 @group = Group.new(group_params)
	 if @group.save
	  redirect_to root_path, notice: "グループを作成しました"
	 else
	 	flash.now[:alert] = "グループ名を入力してください"
		render :new
	 end
	end

	def edit
		@group = Group.find(params[:id])
	end

	private
	
	def group_params
		params.require(:group).permit(:group_name, { :user_ids => []})
	end

	def login_check
		redirect_to '/users/sign_in' unless user_signed_in?
	end
end

