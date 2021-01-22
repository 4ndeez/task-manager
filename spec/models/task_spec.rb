require 'rails_helper'

RSpec.describe Task, type: :model do
  user = User.create(first_name: 'John', last_name: 'Doe',
                     email: 'sample@example.com', password: 'default')
  context 'validation tests' do
    it 'is valid with valid attributes' do
      task = Task.create(title: 'test', description: 'none', status: 0, user_id: user.id)
      expect(task).to be_valid
    end

    it 'checks title validity' do
      task = Task.create(title: '', description: 'none', status: 0, user_id: user).save
      expect(task).to eq(false)
    end

    it 'checks description validity' do
      task = Task.create(title: 'test', description: '', status: 0, user_id: user).save
      expect(task).to eq(false)
    end

    it 'checks status inclusion' do
      task = Task.create(title: 'test', description: 'none', status: 22, user_id: user).save
      expect(task).to eq(false)
    end

    it 'checks user references presence' do
      task = Task.create(title: 'test', description: 'none', status: 0, user_id: nil).save
      expect(task).to eq(false)
    end
  end
end
