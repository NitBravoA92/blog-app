require 'rails_helper'

describe "Visit the index page of 'posts'", type: :feature do
  before :each do
    @user = User.create(name: 'Jason Rogers', photo: 'https://randomuser.me/api/portraits/men/90.jpg', bio: 'Hello! I am a Web designer from UK.')
  end

  it "should display the username" do
    visit user_posts_path(@user)
    expect(page).to have_content 'Jason Rogers'
  end

end
