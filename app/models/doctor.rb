class Doctor < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :session_limitable, :validatable, authentication_keys: [:login]
  validates :phone_number, presence: true, format: { with: /\A(\(\d{3}\)|\d{3})-?\d{3}-?\d{4}\z/ }

  has_many :appointments
  belongs_to :category

  attr_writer :login

  def login
    @login || self.phone_number || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(phone_number) ILIKE '%#{login.downcase}%' OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
