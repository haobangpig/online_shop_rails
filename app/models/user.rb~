class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
              message: "email format error" }
  validates :password, presence: true,
    confirmation: true,
    length: { minimum: 6 },
    if: :need_with_validate_password
  validates :password_confirmation, presence: true,
    if: :need_with_validate_password

  def username
    self.email.split('@').first
  end

  private

  def need_with_validate_password
    self.new_record? || 
      (!self.password.nil? || self.pasword_confimation.nil?)
  end
end
