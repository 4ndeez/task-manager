require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'validation tests' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'checks first name presence' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it 'checks last name presence' do
      user.last_name = nil
      expect(user.save).to eq(false)
    end

    it 'checks email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'checks email validity' do
      user.email = "notvalid@"
      expect(user.save).to eq(false)
    end

    it 'checks password presence' do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it 'ensures password validity' do
      user.password = '5symb'
      expect(user.save).to eq(false)
    end
  end
end
