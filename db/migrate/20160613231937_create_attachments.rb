class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :file_name
      t.string :file_uid

      t.belongs_to :document, foreign_key: true

      t.timestamps
    end
  end
end
