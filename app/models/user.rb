class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence:true do
    validates :c_last_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :c_first_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :j_last_name,format: { with: /\A[ァ-ヶ]+\z/ }
    validates :j_first_name,format: { with: /\A[ァ-ヶ]+\z/ }
    validates :birthday
    validates :nickname
  end

end
