class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

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
  
  
  has_many :sns_credentials, dependent: :destroy
  has_many :cards
  mount_uploader :image, ImageUploader

  devise :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? 
      user = User.where(id: snscredential.user_id).first
      unless user.present? 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else 
      user = User.where(email: auth.info.email).first
      if user.present? 
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
  
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
   
      end
    end
    return { user: user , sns_id: sns.id }
  end
end

