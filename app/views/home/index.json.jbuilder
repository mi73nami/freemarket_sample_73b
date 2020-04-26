json.array! @category_children do |child|
  json.id child.id
  json.name child.name
end

json.array! @category_grandchildren do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end