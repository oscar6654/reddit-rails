class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  posts = Post.all
  default_scope { order('created_at DESC') }

  scope :ordered_by_title, -> { posts.order(:title) }
  scope :ordered_by_reverse_created_at, -> { posts.order('created_at DESC').reverse }
end
