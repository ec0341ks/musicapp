class Song < ApplicationRecord 
  # keywordにいっちするあーてぃすとけんさく
  def self.artists_search(keyword)
    artists = RSpotify::Artist.search(keyword)
    return artists
  end
  # music_idできょくをけんさく
  def self.music_search_by_id(id)
    music = RSpotify::Track.find(id)
  end
end