class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :slug
      t.string :kind
      t.text :description
      t.text :content
      t.boolean :public
      t.boolean :protected
      t.date :publication_date
      t.string :facebook_url
      t.string :photo_uid
      t.string :photo_name
      t.belongs_to :site, foreign_key: true

      t.timestamps
    end
  end
end
