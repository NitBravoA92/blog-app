require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.create(name: 'William Brown', bio: 'Hi! I am William and I am Frontend Developer')
    @user_url = users_url
  end

  describe 'GET /index' do
    # test if the response status was correct (status 200).
    it 'returns http success' do
      get @user_url
      expect(response).to have_http_status(:success)
    end
  end
end
