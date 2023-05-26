class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :username, presence: true, uniqueness: true

  def is_room_admin?(room)
  	Participant.where(user_id: self.id, room_id: room.id).first.is_room_admin
  end

  def is_room_member?(room)
    Participant.where(user_id: self.id, room_id: room.id).exists?
  end
end
