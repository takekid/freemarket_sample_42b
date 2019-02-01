require 'csv'

csv = CSV.read('db/fixtures/development/size.csv')
  csv.each do |size|
    Size.seed do |s|
    s.id = size[0]
    s.size_name = size[1]
    s.size_type_id = size[2]
  end
end
