class User < ApplicationRecord
  validates :family_name, { presence: true }
  validates :first_name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  has_secure_password

  def User.generate_user_id
    new_user_id = User.generate_new_id
    # Retry generation of user_id for a new user if it matches other's one
    while User.find_by(user_id: new_user_id)
      new_user_id = User.generate_new_id
    end

    return new_user_id
  end

  private

  def User.generate_new_id
    return ((0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a).sample(12).join
  end
end
