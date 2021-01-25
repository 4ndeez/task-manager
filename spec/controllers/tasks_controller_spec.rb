require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }

  context 'GET #index' do
    before do
      @tasks = create(:task)
      get :index
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns instance variable' do
      expect(@tasks).to be_truthy
    end
  end

  context 'GET #show' do
    before do
      @task = create(:task)
      get :show, params: { id: @task }
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns instance variable' do
      expect(@task).to be_truthy
    end
  end

  context 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end
end