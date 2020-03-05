class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :icon, null: false, default: 'folder'

      t.timestamps
    end
  end
end
