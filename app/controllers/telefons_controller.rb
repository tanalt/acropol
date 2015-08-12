class TelefonsController < ApplicationController
  before_action :signed_in_user

  def import
    Telefon.import(params[:file])
    redirect_to root_url, notice: "Успішно імпортовано"
  end

  def edit
    @tel=Telefon.find_by_id(params[:id])
  end
  def update
    @tel=Telefon.find_by_id(params[:id])
    case tel_params[:coop]
      when "Співпраця не перевірена"
        @tel.color="grey"
      when "Співпраця Заборонена"
        @tel.color="red"
      when "Співпраця ризикована"
        @tel.color="orange"
      when "Співпраця можлива"
        @tel.color="green"
      when "Співпраця рекомендована"
        @tel.color="blue"
    end
    if @tel.update_attributes(tel_params_edit)
      redirect_to root_path
    else
      redirect_to telefons_edit_path
    end

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
    case tel_params[:coop]
      when "Співпраця не перевірена"
        @tel.color="grey"
      when "Співпраця Заборонена"
        @tel.color="red"
      when "Співпраця ризикована"
        @tel.color="orange"
      when "Співпраця можлива"
        @tel.color="green"
      when "Співпраця рекомендована"
        @tel.color="blue"
    end

    if @tel.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  private
  def tel_params
    params.require(:telefon).permit(:n_tel, :fio, :name, :coop)
  end
  def tel_params_edit
    params.require(:telefon).permit(:n_tel, :fio, :name, :coop, :color)
  end
  def signed_in_user
    redirect_to signin_url, notice: "Будь-ласка, увійдіть" unless signed_in?
  end



end
