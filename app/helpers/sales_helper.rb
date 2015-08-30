module SalesHelper
  def params_to_hash(par, find_key)
    vul_filtr=nil
    par.each do |key, value|
      if key.include?(find_key)
        if vul_filtr.nil?
          vul_filtr=[value]
        else
          vul_filtr.push(value)
        end
      end
    end
    return vul_filtr
  end


  def cheked(vul_filtr, vulycias, vul)
    vulycias_vivod=nil
    vulycias.each do |vulycia|
      if !vul_filtr.nil?
        @check=vul_filtr.include?("#{vulycia[vul]}")
      else
        @check=false
      end

      if vulycias_vivod.nil?
        vulycias_vivod={vulycia[vul] => @check}
      else
        vulycias_vivod[vulycia[vul]] = @check
      end
    end
    return vulycias_vivod
  end

  def change_but
    @change=""
    if !cookies[:vul_send].nil?
      @change="document.getElementsByName('vul_find').item(0).classList.remove('btn-danger'),
                document.getElementsByName('vul_find').item(0).classList.add('btn-success')"
    end
    if !cookies[:kod_rajonu_send].nil?
      if @change.nil?
        @change="document.getElementsByName('kod_rajonu').item(0).classList.remove('btn-danger'),
                document.getElementsByName('kod_rajonu').item(0).classList.add('btn-success')"
      else
        @change=@change+", document.getElementsByName('kod_rajonu').item(0).classList.remove('btn-danger'),
                document.getElementsByName('kod_rajonu').item(0).classList.add('btn-success')"
      end
    end
    if !cookies[:kilk_kimn_send].nil?
      if @change.nil?
        @change="document.getElementsByName('kilk_kimn').item(0).classList.remove('btn-danger'),
                document.getElementsByName('kilk_kimn').item(0).classList.add('btn-success')"
      else
        @change=@change+", document.getElementsByName('kilk_kimn').item(0).classList.remove('btn-danger'),
                document.getElementsByName('kilk_kimn').item(0).classList.add('btn-success')"
      end
    end
    return(@change)

  end



end
