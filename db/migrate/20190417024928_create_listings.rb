class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.references :breed, foreign_key: true
      t.integer :sex
      t.integer :price
      t.integer :deposit
      t.date :date_of_birth
      t.string :diet

      t.timestamps
    end
  end
end
