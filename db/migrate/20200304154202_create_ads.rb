class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
