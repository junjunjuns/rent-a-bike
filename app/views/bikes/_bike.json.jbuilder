json.extract! bike, :id, :name, :type, :manufacturer, :color, :price, :description, :image, :created_at, :updated_at
json.url bike_url(bike, format: :json)
