require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see all playlists a link for each playlist" do
      playlist = create(:playlist)
      playlist2 = create(:playlist)

      visit playlists_path
      expect(page).to have_content playlist.name
      expect(page).to have_content playlist2.name
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
      expect(page).to have_link playlist2.name, href: playlist_path(playlist2)
  end
end