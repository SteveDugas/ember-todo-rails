class AddTodoModel < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :details
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :due
      t.boolean :completed, :default => false
      t.belongs_to :group
      t.timestamps
    end

    create_table :groups do |t|
      t.string :name
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  
    create_table :tags_todos, id: false do |t|
      t.belongs_to :todo
      t.belongs_to :tag
      t.timestamps
    end
  end
end
