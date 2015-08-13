class UsersController < ApplicationController
  before_action :signed_in_user, :check_activivty
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    @user.privilege=3
    if @user.save
      redirect_to users_show_path
    else
      render 'new'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    redirect_to "/users/show"
  end

  def password
    @user=User.find(params[:id])
  end
  def change_pass
    @user=User.find(params[:id])
    if @user.update_attributes(user_params_pass)
      redirect_to users_show_path
      flash[:error]="Успішно відредаговано"
    else
      render users_password_path
    end

  end

  def update
    @user=User.find(params[:id])
    if user_params_pass[:password].nil?
      if @user.update_attributes(user_params_edit)
        redirect_to users_show_path
        flash[:error]="Успішно відредаговано"
      else
        render "/users/find"
      end
    else
      if user_params_pass[:password].length==0
        flash[:error]="Пароль не може бути пустим"
        render "/users/password/"
      else
        if @user.update(user_params_pass)
          redirect_to users_show_path
          flash[:error]="Успішно відредаговано пароль "
        else
          render "/users/password/"
        end
      end
    end
  end

  def find
    @user=User.find_by_id(params[:id])
  end


  def delete
    @us=User.find_by_id(params[:id])
  end

  def show
    if params[:id]=="show_act"
      @users=User.where("activity>'#{Time.now-60}'")
    else
      @users=User.all
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :fio)
  end

  def user_params_edit
    params.require(:user).permit(:name, :fio, :privilege)
  end
  def user_params_pass
    params.require(:user).permit(:password, :password_confirmation)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Будь-ласка, увійдіть" unless signed_in?
  end
  def check_activivty
    user = User.find_by(current_user.id)
    user.activity=Time.now
    user.save
  end

end
