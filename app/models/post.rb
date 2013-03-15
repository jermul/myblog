class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :tags_attributes

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy, order: "created_at DESC"
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def self.search(search, page)
    paginate per_page: 5, page: page, order: "created_at DESC",
             conditions: ['title ILIKE? OR content ILIKE?', "%#{search}%", "%#{search}%"]
  end
end
