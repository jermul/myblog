class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :posts

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.search(search, page)
    paginate per_page: 10, page: page, order: "name",
             conditions: ['name ILIKE?', "%#{search}%"]
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

