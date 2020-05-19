class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
  def self.created_before(time)
    where('date <= ?', time)
  end

  def self.upcoming_events(time)
    where('date > ?', time)
  end
  validates :date, presence: true
  validates :description, presence: true, length: {maximum: 300}
end
