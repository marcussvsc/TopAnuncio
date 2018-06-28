class AddAvatarsToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :avatars, :json
  end
end
