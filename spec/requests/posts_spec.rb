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

    # test If the response body includes correct content.
    it 'renders the index template with correct content' do
      get @user_url_posts

      expected_result_user = "#{@user.name}"
      expect(response.body).to include(expected_result_user)

      expected_result_num_posts = "number of posts: #{@user.id}"
      expect(response.body).to include(expected_result_num_posts)
    end
  end

  describe 'GET /show' do
    before :each do
      @user_url_post = user_post_path(@user, @post)
    end

    # test if the response status was correct (status 200).
    it 'returns http success' do
      get @user_url_post
      expect(response).to have_http_status(:success)
    end

    # test if a correct template was rendered.
    it 'renders the show template' do
      get @user_url_post
      expect(response).to render_template(:show)
    end

    # test If the response body includes correct content.
    it 'renders the index template with correct content' do
      get @user_url_post

      expected_result = "Post ##{@post.id}"
      expect(response.body).to include(expected_result)
    end
  end
end
