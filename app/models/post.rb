class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :summary
  belongs_to :user
  belongs_to :topic

  #default_scope { order('created_at DESC') }
  self.per_page = 100
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    return votes.sum(:value)
  end

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body can
    render_as_markdown(body)
  end

  def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age_in_days

     update_attribute(:rank, new_rank)
   end

  default_scope { order('rank DESC') }


  def create_vote
    user.votes.create(value: 1, post: self)
  end

  def save_with_initial_vote
    self.save
  end

end
