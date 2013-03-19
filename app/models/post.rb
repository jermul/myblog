class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list
  acts_as_taggable

  has_many :comments, dependent: :destroy, order: "created_at DESC"

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true

  def self.search(search, page)
    paginate per_page: 6, page: page, order: "created_at DESC",
             conditions: ['title ILIKE? OR content ILIKE?', "%#{search}%", "%#{search}%"]
  end
end