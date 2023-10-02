require 'rails_helper'

describe "Visit the index page of 'users'", type: :feature do
  before :each do
    @first_user = User.create(name: 'Frank Miller', photo: 'https://randomuser.me/api/portraits/men/88.jpg', bio: 'Hello! I am a Ruby Backend Developer from USA.')
    @second_user = User.create(name: 'Jason Rogers', photo: 'https://randomuser.me/api/portraits/men/90.jpg', bio: 'Hello! I am a Web designer from UK.')
    @third_user = User.create(name: 'Peter Williams', photo: 'https://randomuser.me/api/portraits/men/32.jpg', bio: 'Hello! I am a QA expert from Scotland.')
  end

  it "should display the username of all the users" do
    visit users_path
    expect(page).to have_content 'Frank Miller'
    expect(page).to have_content 'Jason Rogers'
    expect(page).to have_content 'Peter Williams'
  end

  it 'should display the profile picture of each user' do
    visit users_path
    expect(page).to have_selector('img')
    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/88.jpg"]')
    expect(page).to have_css('img[alt="Frank Miller photo"]')
    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/90.jpg"]')
    expect(page).to have_css('img[alt="Jason Rogers photo"]')
    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/32.jpg"]')
    expect(page).to have_css('img[alt="Peter Williams photo"]')
  end

end
