require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Mark Miller', bio: 'I am Mark Miller and I am a Backend Developer')
    @post = Post.create(author: @user, title: 'My first post about Backend technologies', text: 'This is the first post of Mark Miller')
  end

  describe '#most_recent_comments' do
    it 'should return an empty array when the post does not have any comment' do
      recent_comments = @post.most_recent_comments
      expected_results = []

      expect(recent_comments).to eq(expected_results)
    end

    it 'should return the last 5 comments added on a post' do
      first_comment = Comment.create(post: @post, author: @user, text: 'This is the first comment of Mark Miller')
      second_comment = Comment.create(post: @post, author: @user, text: 'This is the second comment of Mark Miller')
      third_comment = Comment.create(post: @post, author: @user, text: 'This is the third comment of Mark Miller')
      fourth_comment = Comment.create(post: @post, author: @user, text: 'This is the fourth comment of Mark Miller')
      fifth_comment = Comment.create(post: @post, author: @user, text: 'This is the fifth comment of Mark Miller')

      recent_comments = @post.most_recent_comments
      expected_results = [fifth_comment, fourth_comment, third_comment, second_comment, first_comment]

      expect(recent_comments).to eq(expected_results)
    end
  end

  describe '#update_posts_counter_by_user' do
    it 'should update the posts_counter attribute of the author of a post' do
      second_post = Post.create(author: @user, title: 'My second post about Backend technologies', text: 'This is the second post of Mark Miller')

      second_post.update_posts_counter_by_user
      expected_results = 2

      expect(@user.posts_counter).to eq(expected_results)
    end
  end

  describe 'attributes validation' do
    it 'The Post should not be valid without a title' do
      @post.title = nil

      expect(@post).to_not be_valid
    end

    it 'The Post should not be valid when the title has more than 250 characters' do
      long_post_title = 'Third post title' * 16 
      @post.title = nil

      expect(@post).to_not be_valid
    end

    it 'The Post should not be valid when the comments_counter attribute is not an integer' do
      @post.comments_counter = 'new string'

      expect(@post).to_not be_valid
    end

    it 'The Post should not be valid when the comments_counter is less than 0' do
      @post.comments_counter = -5

      expect(@post).to_not be_valid
    end

    it 'The Post should be valid when the comments_counter is greater than or equal to 0' do
      @post.comments_counter = 13

      expect(@post).to be_valid
    end

    it 'The Post should not be valid when the likes_counter attribute is not an integer' do
      @post.likes_counter = 'new string'

      expect(@post).to_not be_valid
    end
  end
end
