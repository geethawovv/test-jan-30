class User < ApplicationRecord
  validates :email, presence: true
  validates_uniqueness_of :email
  scope :search,->(searchterm) do
    where("firstname LIKE ?","%#{searchterm}%").or(where("lastname LIKE ?","%#{searchterm}%")
      ).or(where("email LIKE ?","%#{searchterm}%"))
  end
end
