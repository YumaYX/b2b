# frozen_string_literal: true

# Look up records in CSV data and flag duplicates

require 'csv'

# Store the location of each unique key in the data
#
# @param data [Array<Array<String>>] The data to search through
# @param key_index [Integer] The index of the key to use for lookup
# @return [Hash<String, Integer>] A hash mapping each unique key to its index in the data
def store_data_location(data:, key_index:)
  data_location = {}

  data.each.with_index do |element, index|
    key = element[key_index].to_s

    # index = 0: duplicated
    index = 0 if data_location.key?(key)
    data_location.store(key, index)
  end
  data_location
end

# Search for the location of each unique key in the data
#
# @param csv_file_path [String] The path to the CSV file to search
# @param target_key [String] The key to use for lookup
# @return [Hash<String, Integer>] A hash mapping each unique key to its index in the data
def search_data_location(csv_file_path: 'sample.csv',
                         target_key: 'id')
  csv_data_arr = CSV.read(csv_file_path)

  # key column index number
  headers = csv_data_arr.first
  headers_hash = headers.each.with_index.to_h #=> {'id' => 0, 'name' => 1, ...}
  key_column_index_number = headers_hash[target_key]

  store_data_location(data: csv_data_arr, key_index: key_column_index_number)
end

def main
  # search preparation
  ## find the index beforehand
  data_index = search_data_location(csv_file_path: 'sample.csv', target_key: 'email')
  ## load the CSV data into memory and assign it to a variable.
  csv_data_arr = CSV.read('sample.csv')

  # example: search
  puts '=== SEARCH ==='
  keys_for_search = ['john@example.com', 'ken@example.com', 'maria@example.com']
  keys_for_search.each do |key_for_search|
    location_index = data_index[key_for_search]
    if location_index.eql?(0)
      # TODO: modify as needed
      p "#{key_for_search} is duplicated."
    else
      # TODO: modify as needed
      p csv_data_arr[location_index]
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
