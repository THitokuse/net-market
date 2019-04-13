json.array! @middle_categories.each do |middlecategories|
  json.id   middlecategories.id
  json.name   middlecategories.name
  json.upper_category_id   middlecategories.upper_category_id
  json.size_type_id   middlecategories.size_type_id
end
