class Telefon < ActiveRecord::Base
  VALID_TEL_REGEX = /\d{10}/
  validates :n_tel,  presence: true, format: { with: VALID_TEL_REGEX },
            uniqueness: true


  def self.search(query)
    if "#{query}".length>0
      where("n_tel like ?", "%#{query}%")
    else
      where("n_tel like ?", "%00000%")
    end

  end




  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      telefon = find_by_id(row["id"]) || new
      telefon.attributes = row.to_hash.slice(*row.to_hash.keys)
      telefon.save
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end



end
