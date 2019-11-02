json.extract! category, :id, :titre, :description, :slug, :administrateur_id, :created_at, :updated_at
json.url category_url(category, format: :json)
