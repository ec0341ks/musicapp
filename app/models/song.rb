class Song < ApplicationRecord 
  # keywordにいっちするあーてぃすとけんさく
  def self.artists_search(keyword)
    artists = RSpotify::Artist.search(keyword)
    return artists
  end
  # music_idできょ くをけんさく
  def self.music_search_by_id(id)
    music = RSpotify::Track.find(id)
    return music
  end
end