class IpsController < ApplicationController
  before_action :signed_in_user, :check_activivty, :check_ip
  def index
    @ip=Ip.all
  end
  def delete
    @us=Ip.find_by_id(params[:id])
  end
  def destroy
    Ip.find(params[:id]).destroy
    redirect_to "/ips/index"
  end
  def new
    @ip=Ip.new
  end
  def create
    @ip=Ip.new(ip_params)
    if @ip.save
      redirect_to ips_index_path
    else
      render 'new'
    end
  end
  private
  def ip_params
    params.require(:ip).permit(:ip)
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
