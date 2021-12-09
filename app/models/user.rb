class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy

  def generate_token
    self.token = SecureRandom.hex(10)
    self.save
  end

  def remove_token
    self.token = nil
    self.save
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
