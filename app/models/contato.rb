class Contato < ApplicationRecord
  validates :email, :phone_number, :birthday, :weight, presence: true
  validates :email, uniqueness: true
end
