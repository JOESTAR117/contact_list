class UsersController < ApplicationController
  before_action :require_logged_in_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Usuario cadastrado com sucesso!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Dados Atualizados com sucesso!'
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
