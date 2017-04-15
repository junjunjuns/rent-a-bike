json.extract! profile, :id, :fname, :lname, :age, :email, :phone, :profile_picture, :created_at, :updated_at
json.url profile_url(profile, format: :json)
