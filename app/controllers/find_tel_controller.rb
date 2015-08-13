class FindTelController < ApplicationController
  before_action :signed_in_user, :check_activivty
  def index
    @telefons = Telefon.search(params[:search])
  end
  def show
    @telefon = Telefon.where("n_tel like? %#{params[:search]}%")
  end

  def destroy
    Telefon.find(params[:id]).destroy
    redirect_to "/find_tel/index"
  end
  def delete
    @tel=Telefon.find_by_id(params[:id])

  end
  private
  def signed_in_user
    redirect_to signin_url, notice: "Будь-ласка, увійдіть" unless signed_in?
  end
  def check_activivty
    user = User.find_by_id(current_user.id)
    user.activity=Time.now
    user.save
  end

end
