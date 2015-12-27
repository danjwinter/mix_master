require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see all artists and a link for each one" do
    jimi_pic = "http://www.911tabs.com/img/upload/band_bg/2222_jimi_hendrix_min.jpg"
    zappa_pic = "http://www.allaboutjazz.com/media/large/b/c/5/92414d2ccbe975e049634c084f0d6.jpg"
    artist1 = Artist.create(name: "Frank Zappa", image_path: zappa_pic)
    artist2 = Artist.create(name: "Jimi Hendrix", image_path: jimi_pic)
    visit artists_path

    expect(page).to have_content "Frank Zappa"
    expect(page).to have_content "Jimi Hendrix"
    my_link = find(:css, "a:contains('Frank Zappa')")
    my_link.click

    expect(page).to have_css("img[src=\"#{zappa_pic}\"]")
    visit artists_path
    my_link2 = find(:css, "a:contains('Jimi Hendrix')")
    my_link2.click
    expect(page).to have_css("img[src=\"#{jimi_pic}\"]")

  end

end