class Playlist < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  def include_song?(song)
    songs.include?(song) ? true : false
  end
end
