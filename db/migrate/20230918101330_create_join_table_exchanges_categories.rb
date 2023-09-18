class CreateJoinTableExchangesCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :exchanges, :categories do |t|
      t.index [:exchange_id, :category_id]
      t.index [:category_id, :exchange_id]
    end
  end
end
