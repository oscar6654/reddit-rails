class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader
  default_scope { order('created_at DESC') }
  self.per_page = 100
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body
    render_as_markdown(body)
  end
end
