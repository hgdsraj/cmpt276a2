json.extract! trainer, :id, :name, :email, :created_at, :updated_at
json.extract! tokimon, :id
json.url trainer_url(trainer, format: :json, tokimon, format: :json)
