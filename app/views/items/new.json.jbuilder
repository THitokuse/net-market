json.array! @middle_categories do |midddle_category|
  json.id   midddle_category.id
  json.name   midddle_category.name
  json.upper_category_id   midddle_category.upper_category_id
  json.size_type_id   midddle_category.size_type_id
end

json.array! @lower_categories do |lower_category|
  json.id   lower_category.id
  json.name   lower_category.name
  json.middle_category_id   lower_category.middle_category_id
end

json.array! @sizes do |size|
  json.id   size.id
  json.name   size.name
  json.size_type_id   size.size_type_id
end

json.array! @delivery_methods do |delivery|
  json.id   delivery.id
  json.name delivery.name
end

