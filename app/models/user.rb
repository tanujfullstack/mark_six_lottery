class User < ApplicationRecord

  has_many :user_tickets
  has_many :tickets, -> { distinct }, through: :user_tickets

  has_many :draws, through: :user_tickets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
