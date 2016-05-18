class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :trackable,
         :validatable,
         :lockable,
         :timeoutable

  has_one :portal

  # def portal
  #   super || Environment.default_portal
  # end

  def email_required?
    !is_admin?
  end

  def is_admin?
    username == 'admin'
  end

  def active_for_authentication?
    super && !suspended_at
  end

end
