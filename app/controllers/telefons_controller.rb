class TelefonsController < ApplicationController
  before_action :signed_in_user, :check_activivty, :check_ip

  def export
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="report.xls"'
    headers['Cache-Control'] = ''
    @users = Telefon.all
  end

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
      when "Співпраця заборонена повністю"
        @tel.color="red"
      when "Співпраця по обєктах акрополя заборонена"
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
      when "Співпраця заборонена повністю"
        @tel.color="red"
      when "Співпраця по обєктах акрополя заборонена"
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
  def check_activivty
    user = User.find_by_id(current_user.id)
    user.activity=Time.now
    user.save
  end
  def check_ip
    if Ip.find_by_ip(request.remote_ip).nil?&!admin?
      redirect_to signin_url, notice: "Зайти неможливо"
    end
  end

end
