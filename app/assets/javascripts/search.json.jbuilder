json.array! @artists do |artist|
  json.name artist.name
  json.uri  artist.uri
end