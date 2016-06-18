class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
