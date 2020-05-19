require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'authentication' do
    it 'http success status for signup' do
      get '/users/new'
      expect(response).to have_http_status(:success)
    end
  end
end
