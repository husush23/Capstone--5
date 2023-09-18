class Category < ActiveRecord::Migration[7.0]
  def change
    create_table :category do |t|
      t.references :user, null: false, foreign_key: {to_table: :users} 
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
