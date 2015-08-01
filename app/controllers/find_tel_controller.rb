class FindTelController < ApplicationController
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
end
