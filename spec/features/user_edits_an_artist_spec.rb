require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they can edit an artist and see those updates" do
    zappa_pic = "http://www.allaboutjazz.com/media/large/b/c/5/92414d2ccbe975e049634c084f0d6.jpg"
    artist1 = Artist.create(name: "Frank Zappa", image_path: zappa_pic)

    visit artist_path(artist1)
    click_on "Edit"
    fill_in "artist_name", with: "Frankie Zappa"
    click_on "Update Artist"

    expect(page).to have_content "Frankie Zappa"

    expect(page).to have_css("img[src=\"#{zappa_pic}\"]")
  end
end