require 'rails_helper'

describe "Visit the show page of 'users'", type: :feature do
  before :each do
    @user = User.create(name: 'Frank Miller', photo: 'https://randomuser.me/api/portraits/men/88.jpg', bio: 'Hello! I am a Ruby Backend Developer from USA.')
  end

  it "should display the username" do
    visit user_path(@user)
    expect(page).to have_content 'Frank Miller'
  end
end
