class Doctor < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :appointments
  belongs_to :category
end
