class Group < ActiveRecord::Base
  has_many :todos

  def todo_ids
    todos.map(&:id)
  end

  def as_json
    {
      :id => id,
      :name => name,
      :todo_ids => todo_ids,
      :sort_order => sort_order
    }
  end
end