class CreateJoinTableExchangesCategories < ActiveRecord:
  :migration[7]
  def change;
create_join_table:
  categories, :  xchanges do |t|
    index [:category_id, :ex  hange_id]
      dex [:exchange_id, :cate  ory_id]
    en   end;
