class Event < ApplicationRecord
  belongs_to :user
  has_many :event_signups
  has_many :users, through: :event_signups
  has_many :comments
end
