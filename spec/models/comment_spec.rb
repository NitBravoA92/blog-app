require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Peter Miller', bio: 'I am Peter Miller and I am a Frontend Developer')
    @post = Post.create(author: @user, title: 'My first post about Frontend technologies',
                        text: 'This is the first post of Peter Miller')
  end

  describe '#update_comments_counter_by_post' do
    it 'should update the comments_counter attribute of a post' do
      comment_author = User.create(name: 'Frank Mendez', bio: 'I am Frank Mendez')
      comment = Comment.create(post: @post, author: comment_author,
                               text: 'This is the first comment on Peter Miller Post')

      comment.update_comments_counter_by_post
      expected_result = 1

      expect(@post.comments_counter).to eq(expected_result)
    end
  end
end
