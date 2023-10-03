require 'rails_helper'

describe "Visit the show page of 'users'", type: :feature do
  before :each do
    @user = User.create(name: 'Frank Miller', photo: 'https://randomuser.me/api/portraits/men/88.jpg',
                        bio: 'Hello! I am a Ruby Backend Developer from USA.')
  end

  it 'should display the username' do
    visit user_path(@user)
    expect(page).to have_content 'Frank Miller'
  end

  it 'should display the profile picture of the user' do
    visit user_path(@user)

    expect(page).to have_selector('img')

    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/88.jpg"]')
    expect(page).to have_css('img[alt="Frank Miller photo"]', count: 1)
  end

  it 'should display the number of posts the user has written' do
    Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')

    visit user_path(@user)

    expect(page).to have_content 'Number of posts: 2'
  end

  it "should display the user's bio" do
    visit user_path(@user)

    expected_result = 'Hello! I am a Ruby Backend Developer from USA.'

    expect(page).to have_content expected_result
  end

  it 'should display only the three latest posts of the user' do
    Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')
    Post.create(author: @user, title: 'Post 3', text: 'This is the content of Post 3')

    visit user_path(@user)

    expect(page).to have_css('.user_posts .post_item_container', count: 3)

    expect(page).to have_content 'Post 1'
    expect(page).to have_content 'Post 2'
    expect(page).to have_content 'Post 3'
  end

  it "should display a button with the text: 'See all posts' that allows user to see all its posts" do
    Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')
    Post.create(author: @user, title: 'Post 3', text: 'This is the content of Post 3')

    visit user_path(@user)

    expect(page).to have_content 'See all posts'
  end

  it "Clicking on the 'See all posts' button should redirect to user's posts page" do
    Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')

    visit user_path(@user)

    click_link 'See all posts'

    expect(page).to have_current_path(user_posts_path(@user))
  end

  it "Clicking on each post title should redirect to post's show page" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')

    visit user_path(@user)

    click_link 'Post 1'

    expect(page).to have_current_path(user_post_path(@user, post1))
  end
end
