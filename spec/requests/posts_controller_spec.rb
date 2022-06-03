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

    describe 'tests for show posts' do
        before(:example) { get user_posts_path(user_id: 1, id: 1) }
    
        it 'Renders correct post data and give out the correct status' do
          expect(response).to have_http_status(200)
        end

        it 'renders the correct view' do
            expect(response).to render_template(:show)
        end
    end
end