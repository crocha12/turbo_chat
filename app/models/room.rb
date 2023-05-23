class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
end
