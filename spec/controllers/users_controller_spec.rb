require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    before do
      @users = create(:user)
      get :index
    end

    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'assigns instance variable' do
      expect(@users).to be_truthy
    end
  end

  context 'GET #show' do
    before do
      @user = create(:user)
      get :show, params: { id: @user }
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns instance variable' do
      expect(@user).to be_truthy
    end
  end
end