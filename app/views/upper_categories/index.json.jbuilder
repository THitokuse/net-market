json.array! @upper_categories.each do |categories|
  json.id   categories.id
  json.name   categories.name
end
