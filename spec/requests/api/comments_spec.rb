require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    # Get a list of comments for a post with the specified parameters (user_id and post_id)
    get 'Retrieves a list of comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: "The user's id that written the posts"
      parameter name: :post_id, in: :path, type: :string, description: "The post's id that has the comments"

      # status code 200 - the posts was successfully found
      response '200', 'List of comments found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 users_id: { type: :integer },
                 posts_id: { type: :integer },
                 text: { type: :string }
               },
               required: %w[id user_id post_id text]

        let(:user_id) do
          User.create(name: 'James', email: 'james@gmail.com', encrypted_password: '78548dhfudygufydg74').id
        end
        let(:post_id) do
          Post.create(title: 'Post #1', author_id_id: user_id, text: 'This is a testing post').id
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    # Save a new comment on a post with the specified parameters (user_id, post_id and text)
    post 'Create a comment on a post' do
      tags 'Comment'
      consumes 'application/json'

      parameter name: :user_id, in: :path, type: :string, description: "The user's id that written the posts"
      parameter name: :post_id, in: :path, type: :string, description: "The post's id that has the comments"
      parameter name: :text, in: :body, type: :string, description: 'Content of the comment'

      # Status code 201 - the comment was successfully created
      response '201', 'Comment created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 users_id: { type: :integer },
                 posts_id: { type: :integer },
                 text: { type: :string }
               },
               required: %w[id user_id post_id text]

        let(:user_id) do
          User.create(name: 'James', email: 'james@gmail.com', encrypted_password: '78548dhfudygufydg74').id
        end
        let(:post_id) do
          Post.create(title: 'Post #1', author_id_id: user_id, text: 'This is a testing post').id
        end
        let(:text) { 'This is a testing comment' }

        run_test!
      end

      # Status code 422 - the comment was not created
      response '422', 'Unprocessable entity' do
        run_test!
      end
    end
  end
end
