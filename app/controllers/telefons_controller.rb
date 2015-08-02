class TelefonsController < ApplicationController
  before_action :signed_in_user

  def import
    Telefon.import(params[:file])
    redirect_to root_url, notice: "Успішно імпортовано"
  end


  def new
    @tel=Telefon.new
  end

  def destroy
    Telefon.find(params[:id]).destroy
    redirect_to root_path
  end
  def delete
    @tel=Telefon.find_by_id(params[:id])

  end
  def create
    @tel=Telefon.new(tel_params)
    if @tel.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  private
  def tel_params
    params.require(:telefon).permit(:n_tel)
  end
  def signed_in_user
    redirect_to signin_url, notice: "Будь-ласка, увійдіть" unless signed_in?
  end



end
