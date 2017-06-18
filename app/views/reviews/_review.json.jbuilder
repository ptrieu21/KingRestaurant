json.extract! review, :id, :username, :content, :food_item_id, :created_at, :updated_at
json.url review_url(review, format: :json)
