class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
        #  %i[facebook google_oauth2]
        #  [:facebook]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7, maximum: 15}
  validates :password_confirmation, presence: true, length: { minimum: 7, maximum: 15}
  validates :number, presence: true, uniqueness: true, length: { minimum: 10}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :postcode, presence: true
  validates :prefectures, presence: true
  validates :city, presence: true
  validates :streetNumber, presence: true
  validates :building, presence: true
  validates :cordNumber, presence: true, uniqueness: true
  
  
  has_many :sns_credentials, dependent: :destroy
  has_many :cards
  has_many :items
  mount_uploader :image, ImageUploader

  # devise :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? 
      user = User.where(id: snscredential.user_id).first
      unless user.present? 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          uid:      auth.uid,
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
          email: auth.info.email,
        )
  
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
   
      end
    end
    return { user: user , sns_id: sns.id }
  end

  # def self.find_oauth(auth)
  #   uid = auth.uid
  #   provider = auth.provider
  #   snscredential = SnsCredential.where(uid: uid, provider: provider).first
  #   if snscredential.present?
  #     user = User.where(id: snscredential.user_id).first
  #   else
  #     user = User.where(email: auth.info.email).first
  #     if user.present?
  #       SnsCredential.create(
  #         uid: uid,
  #         provider: provider,
  #         user_id: user.id
  #         )
  #     else
  #       user = User.create(
  #         nickname: auth.info.name,
  #         email:    auth.info.email,
  #         password: "aaa",
  #         password_confirmation: "aaa",
  #         )
  #       SnsCredential.create(
  #         uid: uid,
  #         provider: provider,
  #         user_id: user.id
  #         )
  #     end
  #   end
  #   return user
  # end



  # def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first

  #   unless user
  #     user = User.create(
  #       uid: auth.uid,
  #       provider: auth.provider,
  #       nickname: auth.info.name,
  #       email: User.dummy_email(auth),
  #       password: Devise.friendly_token[0, 20]
  #     )
  #   end

  #   user
  # end

  # private

  # # Create dummy email for OAuth
  # def self.dummy_email(auth)
  #   "#{auth.uid}-#{auth.provider}@example.com"
  # end




  # def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first
  #   unless user
  #    user = User.new(
  #      uid: auth.uid,
  #      provider: auth.provider,
  #     #  email: auth.info.email,
  #      password: Devise.friendly_token[0, 20]
  #    )
  #  user.save
  #  end
  # user
  # end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #   end
  # end




  # def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first

  #   unless user
  #     user = User.create(
  #       uid:      auth.uid,
  #       provider: auth.provider,
  #       email:    auth.info.email,
  #       name:  auth.info.name,
  #       password: Devise.friendly_token[0, 20],
  #       image:  auth.info.image
  #     )
  #   end

  #   user
  # end
end

