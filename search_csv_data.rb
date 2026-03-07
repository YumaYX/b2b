require "csv"

# pre process
## 1: header (or duplication)
## 2: data

csv_file_name = "sample.csv"
csv = CSV.read(csv_file_name, headers: true)

headers = csv.headers
headers_hash = headers.each.with_index.to_h

rows = headers + csv.map(&:fields)
data_location= {}
rows.each.with_index do |element, index|
  key = "id"
  key_column = headers_hash[key]
  target = element[key_column].to_s
  if data_location.key?(target)
    data_location.store(target, 0)
  else
    data_location.store(target, index)
  end
end

# search
keywords = ["1","3","4"]
keywords.each do |target_key|
  location_index = data_location[target_key]
  p rows[location_index]
end
