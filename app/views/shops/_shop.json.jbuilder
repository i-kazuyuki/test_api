json.extract! @shop, :id, :name, :address
json.url shop_url(@shop, format: :json)
