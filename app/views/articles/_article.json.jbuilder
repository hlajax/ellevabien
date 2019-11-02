json.extract! article, :id, :titre, :resume, :contenu, :image, :slug, :category_id, :auteur_id, :created_at, :updated_at
json.url article_url(article, format: :json)
