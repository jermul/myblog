class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :tags_attributes

  validates :title, presence: true,
  					length: { :minimum => 5 }

  has_many :comments, dependent: :destroy, order: "created_at DESC"
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def self.search(search)

  	if search
  	  where 'title ILIKE? OR content ILIKE?', "%#{search}%", "%#{search}%"
    else
      scoped
    end
  end
end
