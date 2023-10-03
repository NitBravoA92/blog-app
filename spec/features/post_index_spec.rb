require 'rails_helper'

describe "Visit the index page of 'posts'", type: :feature do
  before :each do
    @user = User.create(name: 'Jason Rogers', photo: 'https://randomuser.me/api/portraits/men/90.jpg', bio: 'Hello! I am a Web designer from UK.')
  end

  it "should display the username" do
    visit user_posts_path(@user)
    expect(page).to have_content 'Jason Rogers'
  end

  it 'should display the profile picture of the user' do
    visit user_posts_path(@user)

    expect(page).to have_selector('img')

    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/90.jpg"]')
    expect(page).to have_css('img[alt="Jason Rogers photo"]', count: 1)
  end

  it "should display the number of posts the user has written" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')
    post3 = Post.create(author: @user, title: 'Post 3', text: 'This is the content of Post 3')

    visit user_posts_path(@user)

    expect(page).to have_content 'Number of posts: 3'
  end
end
