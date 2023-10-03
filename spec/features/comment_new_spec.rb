require 'rails_helper'

describe "Visit the new page of 'comments'", type: :feature do
  before :each do
    @user = User.create(name: 'Mark Jhons', photo: 'https://randomuser.me/api/portraits/men/90.jpg',
                        bio: 'Hello! I am a Web developer from Australia.')
    @post = Post.create(author: @user, title: 'Post 3', text: 'This is the content of Post 3')
  end

  it "should display the page title: 'Create a new comment'" do
    visit new_user_post_comment_path(@user, @post)
    expect(page).to have_content 'Create a new comment'
  end

  it "should display the form labels: 'Text'" do
    visit new_user_post_comment_path(@user, @post)
    expect(page).to have_content 'Text'
  end

  it "should create a new comment in a post when the user clicks on 'Save comment' button" do
    visit new_user_post_comment_path(@user, @post)

    within('form') do
      fill_in 'Text', with: 'This is the second comment on Post 3'
    end
    click_button 'Save comment'
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
