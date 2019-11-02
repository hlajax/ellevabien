class AddNomProfilToAuteur < ActiveRecord::Migration[6.0]
  def change
    add_column :auteurs, :nom, :string
    add_column :auteurs, :profil, :string
  end
end
