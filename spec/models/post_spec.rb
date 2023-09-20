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
  end
end