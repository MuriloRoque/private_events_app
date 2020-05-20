require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'Should be valid if the attributes are' do
      expect(User.new(name: 'Murilo', email: 'murilo@gmail.com')).to be_valid
    end

    it "Shouldn't save if the name is less than 6 characters" do
      u = User.new(name: 'Muril', email: 'murilo@gmail.com')
      expect(u.save).to eq(false)
    end

    it "Shouldn't save if the email is less than 11 characters" do
      u = User.new(name: 'Murilo', email: '@gmail.com')
      expect(u.save).to eq(false)
    end

    it 'Should save if everything validates' do
      u = User.new(name: 'Murilo', email: 'murilo@gmail.com')
      expect(u.save).to eq(true)
    end
  end

  context 'Association tests' do
    it { should have_many(:events) }
    it { should have_many(:invitations) }
    it { should have_many(:attended_events) }
  end
end
