require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    author = User.create(name: 'Jhon Williams', bio: 'Hi! I am Jhon and I am a QA expert')
    @post = Post.create(author:, title: 'My first post', text: 'This is the body of my first post')
  end

  describe '#update_likes_counter_by_post' do
    it 'should update the likes_counter attribute of a post' do
      like_author = User.create(name: 'Michael Brown', bio: 'Hi! I am Michael Brown')

      first_like = Like.create(post: @post, author: like_author)
      first_like.update_likes_counter_by_post

      second_like = Like.create(post: @post, author: like_author)
      second_like.update_likes_counter_by_post

      expected_result = 2

      expect(@post.likes_counter).to eq(expected_result)
    end
  end
end
