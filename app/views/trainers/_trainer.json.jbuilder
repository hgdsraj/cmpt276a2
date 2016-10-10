json.extract! trainer, :id, :name, :level, :tokimons, :email, :created_at, :updated_at
json.url trainer_url(trainer, format: :json)