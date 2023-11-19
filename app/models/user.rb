class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)\w*\z/ }
  validates :first_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :first_kananame, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_kananame, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
