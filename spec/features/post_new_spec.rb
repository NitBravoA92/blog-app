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

  it "should display the form labels: 'Title' and 'Text'" do
    visit new_user_post_path(@user)
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Text'
  end

  it "should create a new Post when user click on 'Save post' button" do
    visit new_user_post_path(@user)

    within('form') do
      fill_in 'Title', with: 'Post 3'
      fill_in 'Text', with: 'This is the content of Post 3'
    end
    click_button 'Save post'
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
