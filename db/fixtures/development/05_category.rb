require 'csv'

csv = CSV.read('db/fixtures/development/category.csv')
  csv.each do |category|
    Category.seed do |s|
    s.id = category[0]
    s.category_name = category[1]
    s.parent_id = category[4]
    end
end
