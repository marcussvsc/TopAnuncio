json.extract! announcement, :id, :title, :,, :description, :price, :category_id, :user_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
