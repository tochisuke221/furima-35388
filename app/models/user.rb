class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :c_last_name, presence: true
  validates :c_first_name, presence: true
  validates :j_last_name, presence: true
  validates :j_first_name, presence: true
  validates :birthday, presence: true
  validates :nickname, presence: true
end
