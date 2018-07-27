class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
    confirmation: true,
    length: { minimum: 6 },
    if: :need_with_validate_password
  validates :password_confirmation, presence: true,
    if: :need_with_validate_password

  private

  def need_with_validate_password
    self.new_record? || 
      (!self.password.nil? || self.pasword_confimation.nil?)
  end
end
