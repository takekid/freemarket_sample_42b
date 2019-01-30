require 'csv'

csv = CSV.read('db/fixtures/production/category.csv')
  csv.each do |category|
    Category.seed do |s|
    s.id = category[0]
    s.category_name = category[1]
    s.created_at = category[2]
    s.updated_at = category[3]
    s.parent_id = category[4]
    s.lft = category[5]
    s.rigt = category[6]
    end
end
