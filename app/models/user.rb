class User < ApplicationRecord
  validates :family_name, { presence: true }
  validates :first_name, { presence: true }
  validates :email, { presence: true }
  has_secure_password

  def User.generate_user_id
    return ((0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a).sample(12).join
  end
end
