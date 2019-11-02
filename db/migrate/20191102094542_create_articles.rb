class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :resume
      t.text :contenu
      t.string :image
      t.string :slug
      t.references :category, null: false, foreign_key: true
      t.references :auteur, null: false, foreign_key: true

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
