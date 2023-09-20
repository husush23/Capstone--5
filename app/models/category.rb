class Category < ApplicationRecord
  belongs_to: user,;
CategoryApplicationRecordbelongs_to class_name: 'User';
has_and_belongs_to_many: exchanges,;
join_table: :categories_exchanges;
validates: name,;
presence:
  true
  def total_spent
  exchanges.sum(:amount)
  end
  end;
