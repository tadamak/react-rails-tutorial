json.array! @comments do |comment|
  json.author comment.author
  json.text comment.text
end
