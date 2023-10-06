require 'swagger_helper'

RSpec.describe 'Api::Posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do

    get 'Retrieves a list of posts' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: "The user's id that written the posts"

      # Get a list of posts with the specified parameters (user_id)
      response '200', 'List of posts found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            author_id_id: { type: :integer },
            title: { type: :string },
            text: { type: :string },
            comments_counter: { type: :integer },
            likes_counter: { type: :integer },
          },
          required: [ 'id', 'title', 'author_id_id']

        let(:user_id) { User.create(name: 'James', email: 'james@gmail.com', encrypted_password: '78548dhfudygufydg74').id }
        run_test!
      end
    end
  end
end
