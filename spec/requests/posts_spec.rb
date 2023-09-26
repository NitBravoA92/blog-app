require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user = User.create(name: 'William Brown', bio: 'Hi! I am William and I am Frontend Developer')
    @post = Post.create(author: @user, title: 'Post #1', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  describe 'GET /index' do
    before :each do
      @user_url_posts = user_posts_url(@user)
    end

    # test if the response status was correct (status 200).
    it 'returns http success' do
      get @user_url_posts
      expect(response).to have_http_status(:success)
    end

    # test if a correct template was rendered.
    it 'renders the index template' do
      get @user_url_posts
      expect(response).to render_template(:index)
    end
  end
end
