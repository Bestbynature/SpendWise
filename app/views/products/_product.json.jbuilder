json.extract! product, :id, :name, :amount, :user_id, :group_id, :created_at, :updated_at
json.url product_url(product, format: :json)
