class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :records

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])\z/ }
  validates :first_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :first_kananame, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :last_kananame, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :birthday, presence: true

end
