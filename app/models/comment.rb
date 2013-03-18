class Comment < ActiveRecord::Base
  attr_accessible :content#, :post_id ### Uncomment to run rake db:populate

  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { maximum: 400 }
  validates :user_id, presence: true
  validates :post_id, presence: true

  default_scope order: "comments.created_at DESC"
  
end
