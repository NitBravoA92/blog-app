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

  it "should display a post's title" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')

    visit user_posts_path(@user)

    expect(page).to have_content 'Post 1'
  end

  it "should display some of the post's body." do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')

    visit user_posts_path(@user)

    expect(page).to have_content 'This is the content of Post 1'
  end

  it "should display the first comments on a post." do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    comment1 = Comment.create(post: post1, author: @user, text: 'This is the first comment on Post 1')

    visit user_posts_path(@user)

    expect(page).to have_content 'This is the first comment on Post 1'
  end

  it "should display how many comments a post has" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    comment1 = Comment.create(post: post1, author: @user, text: 'This is the first comment on Post 1')
    comment2 = Comment.create(post: post1, author: @user, text: 'This is the first comment on Post 2')
    comment3 = Comment.create(post: post1, author: @user, text: 'This is the first comment on Post 3')

    visit user_posts_path(@user)

    expect(page).to have_content 'Comments: 3, Likes: 0'
  end

  it "should display how many likes a post has" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    like1 = Like.create(post: post1, author: @user)
    like2 = Like.create(post: post1, author: @user)

    visit user_posts_path(@user)

    expect(page).to have_content 'Comments: 0, Likes: 2'
  end

  it "Clicking on each post title should redirect to post's show page" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')

    visit user_posts_path(@user)

    click_link "Post 1"

    expect(page).to have_current_path(user_post_path(@user, post1))
  end

  it "Clicking on the 'Create a post' button should redirect to post's new page" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')

    visit user_posts_path(@user)

    click_link "Create a post"

    expect(page).to have_current_path(new_user_post_path(@user))
  end

  it "should display a section for pagination" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')
    post3 = Post.create(author: @user, title: 'Post 3', text: 'This is the content of Post 3')
    post4 = Post.create(author: @user, title: 'Post 4', text: 'This is the content of Post 4')

    visit user_posts_path(@user)

    expect(page).to have_content 'Pagination'
  end
end
