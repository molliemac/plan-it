class User < ActiveRecord::Base
  has_many :event_users
  has_many :events, through: :event_users

  attr_accessor :email, :role, :encrypted_password, :created_at, :updated_at
  
  enum role: [:user, :collaborator, :organizer]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      	user.provider = auth.provider
      	user.uid = auth.uid
      	user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end 
  end     
end
