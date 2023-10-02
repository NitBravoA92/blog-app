require 'rails_helper'

describe "Visit the index page of 'users'", type: :feature do
  before :each do
    @first_user = User.create(name: 'Frank Miller', photo: 'https://randomuser.me/api/portraits/men/88.jpg', bio: 'Hello! I am a Ruby Backend Developer from USA.')
    @second_user = User.create(name: 'Jason Rogers', photo: 'https://randomuser.me/api/portraits/men/90.jpg', bio: 'Hello! I am a Web designer from UK.')
    @third_user = User.create(name: 'Peter Williams', photo: 'https://randomuser.me/api/portraits/men/32.jpg', bio: 'Hello! I am a QA expert from Scotland.')
  end

  it "should display the username of all the users" do
    visit users_path
    expect(page).to have_content 'Frank Miller'
    expect(page).to have_content 'Jason Rogers'
    expect(page).to have_content 'Peter Williams'
  end

  it 'should display the profile picture of each user' do
    visit users_path
    expect(page).to have_selector('img')
    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/88.jpg"]')
    expect(page).to have_css('img[alt="Frank Miller photo"]')
    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/90.jpg"]')
    expect(page).to have_css('img[alt="Jason Rogers photo"]')
    expect(page).to have_css('img[src="https://randomuser.me/api/portraits/men/32.jpg"]')
    expect(page).to have_css('img[alt="Peter Williams photo"]')
  end

  it "should display the number of posts each user has written" do
    post1_first_user = Post.create(author: @first_user, title: 'Post 1', text: 'This is the content of Post 1')
    post2_first_user = Post.create(author: @first_user, title: 'Post 2', text: 'This is the content of Post 2')
    post1_second_user = Post.create(author: @second_user, title: 'Post 1 second user', text: 'This is the content of Post 1 of second user')
    visit users_path
    expect(page).to have_content 'Number of posts: 2'
    expect(page).to have_content 'Number of posts: 1'
    expect(page).to have_content 'Number of posts: 0'
  end

  it "Clicking on each username should redirect to user's show page" do
    visit users_path
    click_link 'Frank Miller'
    expect(page).to have_current_path (user_path(@first_user))
  end

end
