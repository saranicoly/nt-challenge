json.extract! contato, :id, :email, :phone_number, :birthday, :weight, :created_at, :updated_at
json.url contato_url(contato, format: :json)
