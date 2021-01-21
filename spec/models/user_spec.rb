require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'is valid with valid attributes' do
      user = User.create(first_name: 'John', last_name: 'Doe',
                         email: 'example@example.com', password: 'default')
      expect(user).to be_valid
    end

    it 'checks first name presence' do
      user = User.create(last_name: 'Vel', email: 'example@example.com',
                         password: 'default').save
      expect(user).to eq(false)
    end

    it 'checks last name presence' do
      user = User.create(first_name: 'Andrew1',
                         email: 'example@example.com', password: 'default').save
      expect(user).to eq(false)
    end

    it 'checks email presence' do
      user = User.create(first_name: 'Andrew1', last_name: 'Vel',
                         password: 'default').save
      expect(user).to eq(false)
    end

    it 'checks email validity' do
      user = User.create(first_name: 'Andrew1', last_name: 'Vel',
                         email: 'example.example.com', password: 'default').save
      expect(user).to eq(false)
    end

    it 'checks password presence' do
      user = User.create(first_name: 'Andrew1', last_name: 'Vel',
                         email: 'example@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures password validity' do
      user = User.create(first_name: 'Andrew1', last_name: 'Vel',
                         email: 'example@example.com', password: 'qwert').save
      expect(user).to eq(false)
    end
  end
end
