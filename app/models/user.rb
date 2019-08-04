class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :nickname, presence: true
  validates :number, presence: true, uniqueness: true
  validates :birthday, presence: true
  validates :postCode, presence: true
  validates :prefectures, presence: true
  validates :city, presence: true
  validates :streetNumber, presence: true
  validates :cordNumber, presence: true, uniqueness: true
  
end

