require 'rails_helper'

describe "Visit the new page of 'posts'", type: :feature do
  before :each do
    @user = User.create(name: 'Jason Rogers', photo: 'https://randomuser.me/api/portraits/men/90.jpg',
                        bio: 'Hello! I am a Web designer from UK.')
  end

  it "should display the page title: 'Create a new post'" do
    visit new_user_post_path(@user)
    expect(page).to have_content 'Create a new post'
  end
end
