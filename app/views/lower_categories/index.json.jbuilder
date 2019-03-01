json.array! @lower_categories.each do |lowercategories|
  json.id   lowercategories.id
  json.name   lowercategories.name
  json.middle_category_id   lowercategories.middle_category_id
end
