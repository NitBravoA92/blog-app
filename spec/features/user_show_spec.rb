require 'rails_helper'

describe "Visit the show page of 'users'", type: :feature do
  before :each do
    @user = User.create(name: 'Frank Miller', photo: 'https://randomuser.me/api/portraits/men/88.jpg', bio: 'Hello! I am a Ruby Backend Developer from USA.')
  end

  it "should display the username" do
    visit user_path(@user)
    expect(page).to have_content 'Frank Miller'
  end

  it 'should display the profile picture of the user' do
    visit user_path(@user)

    expect(page).to have_selector('img')

    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/88.jpg"]')
    expect(page).to have_css('img[alt="Frank Miller photo"]', count: 1)
  end

  it "should display the number of posts the user has written" do
    post1 = Post.create(author: @user, title: 'Post 1', text: 'This is the content of Post 1')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'This is the content of Post 2')

    visit user_path(@user)

    expect(page).to have_content 'Number of posts: 2'
  end
end
