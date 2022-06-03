require 'rails_helper'

RSpec.describe 'Posts requests', type: :request do
  describe 'tests for index posts' do
    before(:example) { get user_posts_path(user_id: 1) }

    it 'Renders posts and give out the correct status' do
      expect(response).to have_http_status(200)
    end

    it 'Renders the correct view' do
      expect(response).to render_template(:index)
    end
  end

  it 'Renders correct post data and give out the correct status' do
    get user_post_path(user_id: 1, id: 1)
    expect(response).to have_http_status(200)
  end

  it 'Renders Post #1 from user 1 and renders correct template' do
    get user_post_path(user_id: 1, id: 1)
    expect(response).to render_template(:show)
  end
end
