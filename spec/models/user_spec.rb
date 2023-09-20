require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: "James Miller", bio: "I am James Miller and I am a UX/UI Designer");
    @user.save # save the new user in the test database
  end

  describe '#most_recent_posts' do # test the most_recent_posts method
    it 'should return an empty array when the user: James Miller has not written a post' do
      recent_posts = @user.most_recent_posts
      expected_results = []

      expect(recent_posts).to eq(expected_results)
    end

    it 'should return the 3 most recent posts written by James Miller' do
      first_post = Post.create(author: @user, title: "My first post about UX/UI", text: "This is the first post of James Miller")
      second_post = Post.create(author: @user, title: "My second post about UX/UI", text: "This is the second post of James Miller")
      third_post = Post.create(author: @user, title: "My third post about UX/UI", text: "This is the third post of James Miller")

      recent_posts = @user.most_recent_posts
      expected_results = [third_post, second_post, first_post]

      expect(recent_posts).to eq(expected_results)
    end
  end
end
