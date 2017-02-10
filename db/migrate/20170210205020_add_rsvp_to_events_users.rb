class AddRsvpToEventsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :events_users, :rsvp, :bool
  end
end
