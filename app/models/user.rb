class User < ApplicationRecord
  has_secure_password

  def to_s
    "#{email} (#{ admin? ? 'Admin' : 'Normal' })"
  end
end
