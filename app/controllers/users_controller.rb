class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  
  def index
    @users = User.all
    json_response(@users, 200)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user, 200)
    else
      json_response('Gagal membuat user')
    end
  end

  def show
    json_response(@user, 200)
  end

  def destroy
    if @user.destroy
      json_response('Berhasil menghapus user', 200)
    else
      json_response(@user, 400)
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :photo_url)
  end
end
