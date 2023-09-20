require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Mark Miller', bio: 'I am Mark Miller and I am a Backend Developer')
    @post = Post.create(author: @user, title: 'My first post about UX/UI', text: 'This is the first post of James Miller')
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
end