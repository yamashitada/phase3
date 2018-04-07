class User < ApplicationRecord
  validates :name, presence: true,
                   length: { maximum: 30 }
  validates :email, presence: true,
                    length: { maximum: 250 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_save { email.downcase! }
end
