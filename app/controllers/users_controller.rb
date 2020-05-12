class UsersController < ApplicationController

  before_action :check_current_user
  def show
  @user = User.find(params['id'])
  end

  def check_current_user 
    redirect_to root_path unless
     current_user.id.to_i == params['id'].to_i
  end
end
