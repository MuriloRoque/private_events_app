require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    it "Shouldn't save if there's no date" do
      e = Event.new(creator_id: 1, description: 'Event 1')
      expect(e.save).to eq(false)
    end

    it "Shouldn't save if the description is more than 300 characters" do
      bigstr = 'Event 1247Event 1247Event 1247Event 1247Event 1247Event
               1247Event 1247Event 1247Event 1247Event 1247Event 1247Event
               1247Event 1247Event 1247Event 1247Event 1247Event 1247Event
               1247Event 1247Event 1247Event 1247Event 1247Event 1247Event
               1247Event 1247Event 1247Event 1247Event 1247Event 1247Event
               1247Event 1247Event 1247Event 1247Event 1247Event 1247Event
               1247Event 1247Event 1247Event 1247Event 1247'
      e = Event.new(creator_id: 1, date: '2020-05-20', description: bigstr)
      expect(e.save).to eq(false)
    end
  end

  context 'Association tests' do
    it { should belong_to(:creator) }
    it { should have_many(:invitations) }
    it { should have_many(:attendees) }
  end
end
