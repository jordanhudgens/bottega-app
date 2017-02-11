class EventSignup < ApplicationRecord
  self.table_name = "events_users"
  belongs_to :user
  belongs_to :event
end