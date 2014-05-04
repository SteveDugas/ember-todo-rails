class Todo < ActiveRecord::Base
  belongs_to :group
  has_and_belongs_to_many :tags
  validates :title, :presence => true
end