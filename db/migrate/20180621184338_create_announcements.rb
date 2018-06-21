class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :category_id
      t.integer :user_id
      t.integer :view
      t.timestamps
    end
  end
end
