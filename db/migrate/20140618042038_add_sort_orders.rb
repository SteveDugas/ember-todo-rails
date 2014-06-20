class AddSortOrders < ActiveRecord::Migration
  def change
    add_column :todos, :sort_order, :int
    add_column :groups, :sort_order, :int
  end
end
