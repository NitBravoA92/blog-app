require 'rails_helper'

describe "Visit the show page of 'posts'", type: :feature do
  before :each do
    @user = User.create(name: 'Peter Williams', photo: 'https://randomuser.me/api/portraits/men/32.jpg', bio: 'Hello! I am a QA expert from Scotland.')
    @post = Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')
  end

  it "should display the post's title" do
    visit user_post_path(@user, @post)

    expect(page).to have_content 'Post 2'
  end

  it "should display the post's author" do
    visit user_post_path(@user, @post)

    expect(page).to have_content 'Peter Williams'
  end

  it "should display how many comments the post has" do
    commentor = User.create(name: 'Edward Richards')

    comment1 = Comment.create(post: @post, author: commentor, text: 'This is the first comment on Post 2')
    comment2 = Comment.create(post: @post, author: commentor, text: 'This is the second comment on Post 2')

    visit user_post_path(@user, @post)

    expect(page).to have_content 'Comments: 2, Likes: 0'
  end
end
