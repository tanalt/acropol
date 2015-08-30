class Sale < ActiveRecord::Base

  def self.search(query)
    if "#{query}".length>4
      where("vlasnyk like ?", "%#{query}%")
    else
      where("vlasnyk like ?", "%00000%")
    end

  end
  def self.filtr(query)
      where("lower(vulycia) LIKE ?", "%#{query}%").uniq
  end

  #def self.multi_search(query)

  #end
end
