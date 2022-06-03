require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  it 'Renders users and give out the correct status' do
    get users_path
    expect(response).to have_http_status(:ok)
  end

  it 'Renders the correct view' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'Includes the html text from the page' do
    get users_path
    expect(response.body).to include('Here is the list of users')
  end

  it 'Render correct data and give out the correct status' do
    get user_path(id: 1)
    expect(response).to have_http_status(200)
  end

  it "Renders the correct template" do
    get user_path(id: 1)
    expect(response).to render_template(:show)
  end

  it 'Includes the html text from the page' do
    get user_path(id: 1)
    expect(response.body).to include('Here is the data from this user:')
  end
end
