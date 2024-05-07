class CsvImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    options = { headers: true }
    # Converters used to get rid of the comma in the weight column
    CSV.foreach(opened_file, **options) do |row|      
      order_hash = {}
      material_id = RawMaterial.find_by_material_name(row['Raw Material']).id
      order_hash[:car_number] = row['Car']
      weight_string = row["Invoice Weight"]
      order_hash[:weight] = weight_string.gsub(",", "").to_i

      # Fixing the date format and checking for nil or 'None' values
      if row['Requested'].nil? || row['Requested'] == 'None'
        order_hash[:requested_date] = nil
      else
        order_hash[:requested_date] = Date.strptime(row['Requested'], "%m/%d/%Y").to_fs(:db)
      end
      
      if row['Received'].nil? || row['Received'] == 'None'
        order_hash[:received_date] = nil
      else
        order_hash[:received_date] = Date.strptime(row['Received'], "%m/%d/%Y").to_fs(:db)
      end
      
      if row['Extraction Date'].nil? || row['Extraction Date'] == 'None'
        order_hash[:extraction_start_date] = nil
      else
        order_hash[:extraction_start_date] = Date.strptime(row['Extraction Date'], "%m/%d/%Y").to_fs(:db)
      end
      
      if row['Emptied'].nil? || row['Emptied'] == 'None'
        order_hash[:emptied_date] = nil
      else
        order_hash[:emptied_date] = Date.strptime(row['Emptied'], "%m/%d/%Y").to_fs(:db)
      end
      
      if row['Released'].nil? || row['Released'] == 'None'
        order_hash[:released_date] = nil
      else
        order_hash[:released_date] = Date.strptime(row['Released'], "%m/%d/%Y").to_fs(:db)
      end
      
      order_hash[:raw_material_id] = material_id

      Order.create(order_hash)
    end
  end
end