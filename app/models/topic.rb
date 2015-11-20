class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  scope :visible_to, -> (user) :publicly_viewable
  scope :publicly_viewable, -> { user ? all : where(public: true) }
  scope :privately_viewable, -> { user ? all : where(public: false) }
  self.per_page = 10
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true

end
