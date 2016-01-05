require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they can edit a playlist and see those edits" do

    playlist = create(:playlist_with_songs, songs_count: 2)

    song = playlist.songs.first
    song2 = create(:song)
    visit playlist_path(playlist)
    click_on "Edit"

    fill_in "playlist_name", with: "Thrash"
    find(:css, "#song-#{song2.id}").set(true)
    find(:css, "#song-#{song.id}").set(false)
    click_on "Update Playlist"

    expect(page).to have_content "Thrash"
    expect(page).to have_content "#{song2.title}"
    expect(page).to have_no_content "#{song.title}"
  end
end


