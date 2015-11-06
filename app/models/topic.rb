class Topic < ActiveRecord::Base
  has_many :posts
  self.per_page = 10
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true

end
