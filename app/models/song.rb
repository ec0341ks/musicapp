class Song < ApplicationRecord 
  # keywordにいっちするあーてぃすとけんさく
  def self.artists_search(keyword)
    artists = RSpotify::Artist.search(keyword)
    return artists
  end
end