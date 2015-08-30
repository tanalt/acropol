class SalesController < ApplicationController
  before_action :signed_in_user, :check_activivty
  def find_vul
    if params.keys.include?("find")
      cookies[:vul_send]=""
      @vul_send=cookies[:vul_send]

      if !@vul_send.nil?
        @vul_filtr=@vul_send.split(":")
      end
      if !params[:filtr].nil?
        filtr=UnicodeUtils.titlecase(params[:filtr])
        @vulycias=Sale.filtr(filtr)
      else
        @vulycias=Sale.filtr(params[:filtr])
      end
      @vulycias.each do |vulycia|
        if !@vul_filtr.nil?
          @check=@vul_filtr.include?(vulycia.vulycia)
        else
          @check=false
        end
        if @vulycias_vivod.nil?
          @vulycias_vivod={vulycia.vulycia => @check}
        else
          @vulycias_vivod[vulycia.vulycia] = @check
        end
      end
      @vul_send=""
      if !@vul_filtr.nil?
        @vul_send=@vul_filtr.join(":")
      end
      cookies[:vul_send]=@vul_send
    end
  end


  def index
    @j=1
    params.keys.each do |key|
      @j=@j+1
      case key
        #rozd_proh
        when "delete_all" then
          cookies.delete(:vul_send)
          cookies.delete(:kod_rajonu_send)
          cookies.delete(:kilk_kimn_send)
          cookies.delete(:planuvannya_send)
          cookies.delete(:rozd_proh_send)
          @vul_filtr=nil
          @kilk_kimn_filtr=nil
          @kod_rajonu_filtr=nil
          @planuvannya_filtr=nil
        when "delete_vul" then
          cookies.delete(:vul_send)
          @vul_filtr=nil
        when "delete_kod_rajonu" then
          cookies.delete(:kod_rajonu_send)
          @kod_rajonu_filtr=nil
        when "delete_kilk_kimn" then
          cookies.delete(:kilk_kimn_send)
          @kilk_kimn_filtr=nil
        when "delete_planuvannya" then
          cookies.delete(:planuvannya_send)
          @planuvannya_filtr=nil
        when "delete_rozd_proh" then
          cookies.delete(:rozd_proh_send)
          @rozd_proh_filtr=nil
      end
    end
    @vul_send=cookies[:vul_send]
    if !@vul_send.nil?
      @vul_filtr=@vul_send.split(":")
    end
    @kod_rajonu_send=cookies[:kod_rajonu_send]
    if !@kod_rajonu_send.nil?
      @kod_rajonu_filtr=@kod_rajonu_send.split(":")
    end
    @kilk_kimn_send=cookies[:kilk_kimn_send]
    if !@kilk_kimn_send.nil?
      @kilk_kimn_filtr=@kilk_kimn_send.split(":")
    end
    @planuvannya_send=cookies[:planuvannya_send]
    if !@planuvannya_send.nil?
      @planuvannya_filtr=@planuvannya_send.split(":")
    end
    if !@rozd_proh_send.nil?
      @rozd_proh_filtr=@rozd_proh_send.split(":")
    end

    if params.keys.include?("vul_find")||cookies[:find_now]=="vul_find"
      cookies[:find_now]="vul_find"
      @vulycias=Sale.select("vulycia").uniq
      @vulycias_vivod=cheked(@vul_filtr, @vulycias, "vulycia")
      if params.keys.include?("ok")
        @vul_filtr=params_to_hash(params, "vulycia")
        @vul_send=""
        if !@vul_filtr.nil?
          @vul_send=@vul_filtr.join(":")
          cookies[:vul_send]=@vul_send
        else
          cookies.delete(:vul_send)
        end

      end
    end




    if params.keys.include?("kod_rajonu")||cookies[:find_now]=="kod_rajonu"
      cookies[:find_now]="kod_rajonu"
      @kod_rajonus=Sale.select("kod_rajonu").uniq
      @kod_rajonu_vivod=cheked(@kod_rajonu_filtr, @kod_rajonus, "kod_rajonu")
      if params.keys.include?("ok")
        @kod_rajonu_filtr=params_to_hash(params, "kod_rajonu")
        @kod_rajonu_send=""
        if !@kod_rajonu_filtr.nil?
          @kod_rajonu_send=@kod_rajonu_filtr.join(":")
          cookies[:kod_rajonu_send]=@kod_rajonu_send
        else
          cookies.delete(:kod_rajonu_send)
        end
      end
    end




    if params.keys.include?("kilk_kimn")||cookies[:find_now]=="kilk_kimn"
      cookies[:find_now]="kilk_kimn"
      @kilk_kimns=Sale.select("kilk_kimn").uniq
      @kilk_kimn_vivod=cheked(@kilk_kimn_filtr, @kilk_kimns, "kilk_kimn")
      if params.keys.include?("ok")
        @kilk_kimn_filtr=params_to_hash(params, "kilk_kimn")
        @kilk_kimn_send=""
        if !@kilk_kimn_filtr.nil?
          @kilk_kimn_send=@kilk_kimn_filtr.join(":")
          cookies[:kilk_kimn_send]=@kilk_kimn_send
        else
          cookies.delete(:kilk_kimn_send)
        end
      end
    end



    if params.keys.include?("planuvannya")||cookies[:find_now]=="planuvannya"
      cookies[:find_now]="planuvannya"
      @planuvannyas=Sale.select("planuvannya").uniq
      @planuvannya_vivod=cheked(@planuvannya_filtr, @planuvannyas, "planuvannya")
      if params.keys.include?("ok")
        @planuvannya_filtr=params_to_hash(params, "planuvannya")
        @planuvannya_send=""
        if !@planuvannya_filtr.nil?
          @planuvannya_send=@planuvannya_filtr.join(":")
          cookies[:planuvannya_send]=@planuvannya_send
        else
          cookies.delete(:planuvannya_send)
        end
      end
    end

    if params.keys.include?("rozd_proh")||cookies[:find_now]=="rozd_proh"
      cookies[:find_now]="rozd_proh"
      @rozd_prohs=Sale.select("rozd_proh").uniq
      @rozd_proh_vivod=cheked(@rozd_proh_filtr, @rozd_prohs, "rozd_proh")
      if params.keys.include?("ok")
        @rozd_proh_filtr=params_to_hash(params, "rozd_proh")
        @rozd_proh_send=""
        if !@rozd_proh_filtr.nil?
          @rozd_proh_send=@rozd_proh_filtr.join(":")
          cookies[:rozd_proh_send]=@rozd_proh_send
        else
          cookies.delete(:rozd_proh_send)
        end
      end
    end




    if !(@vul_filtr.nil?||@vul_filtr.empty?)
      @filtr={"vulycia" => @vul_filtr}
    end
    if !(@kod_rajonu_filtr.nil?||@kod_rajonu_filtr.empty?)
      if @filtr.nil?
        @filtr={"kod_rajonu" => @kod_rajonu_filtr}
      else
        @filtr["kod_rajonu"] = @kod_rajonu_filtr
      end
    end
    if !(@kilk_kimn_filtr.nil?||@kilk_kimn_filtr.empty?)
      if @filtr.nil?
        @filtr={"kilk_kimn" => @kilk_kimn_filtr}
      else
        @filtr["kilk_kimn"] = @kilk_kimn_filtr
      end
    end
    if !(@planuvannya_filtr.nil?||@planuvannya_filtr.empty?)
      if @filtr.nil?
        @filtr={"planuvannya" => @planuvannya_filtr}
      else
        @filtr["planuvannya"] = @planuvannya_filtr
      end
    end
    if !(@rozd_proh_filtr.nil?||@rozd_proh_filtr.empty?)
      if @filtr.nil?
        @filtr={"rozd_proh" => @rozd_proh_filtr}
      else
        @filtr["rozd_proh"] = @rozd_proh_filtr
      end
    end


    @sales = Sale.where(@filtr)



  end


  def filtr

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
