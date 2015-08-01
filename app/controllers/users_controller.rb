class UsersController < ApplicationController
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
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params_edit)
      redirect_to users_show_path
      flash[:error]="Успішно відредаговано"
    else
      render '/telefons/main'
    end
  end

  def find
    @user=User.find_by_id(params[:id])
  end


  def delete
    @us=User.find_by_id(params[:id])

  end

  def show
    @users=User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :fio)
  end

  def user_params_edit
    params.require(:user).permit(:name, :fio, :privilege)
  end
end
