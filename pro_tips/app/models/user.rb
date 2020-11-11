class User < ApplicationRecord
  has_many :tips
  has_many :comments

  has_and_belongs_to_many :favourites, class_name: Tip.name

  has_secure_password

  validates :email, presence: true,
                    uniqueness: true

  before_validation :downcase_email

  paginates_per 6


  private

  def downcase_email 
    self.email = email.downcase
  end
end
