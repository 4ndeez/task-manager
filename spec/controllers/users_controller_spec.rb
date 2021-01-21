require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  context 'GET #show' do
    it 'returns a successful response' do
      user = User.create(first_name: 'John', last_name: 'Doe',
                         email: 'example@example.com', password: 'default')
      get :show, params: { id: user }
      expect(response).to have_http_status(:ok)
    end
  end
end