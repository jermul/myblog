class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tags_attributes

  has_many :comments, dependent: :destroy, order: "created_at DESC"
  has_many :tags, dependent: :destroy

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true

  accepts_nested_attributes_for :tags, allow_destroy: true,
    reject_if: proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def self.search(search, page)
    paginate per_page: 6, page: page, order: "created_at DESC",
             conditions: ['title ILIKE? OR content ILIKE?', "%#{search}%", "%#{search}%"]
  end
end
