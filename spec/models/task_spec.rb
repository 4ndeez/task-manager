require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  context 'validation tests' do
    it 'is valid with valid attributes' do
      expect(task).to be_valid
    end

    it 'checks title presence' do
      task.title = nil
      expect(task.save).to eq(false)
    end

    it 'checks title minimal length' do
      task.title = 'qw'
      expect(task.save).to eq(false)
    end

    it 'checks description presence' do
      task.description = nil
      expect(task.save).to eq(false)
    end

    it 'checks status presence' do
      task.status = nil
      expect(task.save).to eq(false)
    end

    it 'checks status inclusion' do
      task.status = Task.statuses.keys.sample
      expect(task.save).to eq(true)
    end

    it 'checks user references presence' do
      task.user_id = nil
      expect(task.save).to eq(false)
    end
  end
end
