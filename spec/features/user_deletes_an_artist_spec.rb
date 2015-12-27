require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they can edit an artist and see those updates" do
    zappa_pic = "http://www.allaboutjazz.com/media/large/b/c/5/92414d2ccbe975e049634c084f0d6.jpg"
    artist1 = Artist.create(name: "Frank Zappa", image_path: zappa_pic)

    visit artist_path(artist1)
    click_on "Delete"
    expect(current_path).to eq artists_path

    expect(page).to have_no_content "Frank Zappa"

  end
end