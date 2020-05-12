class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :participations
  has_many :events, through: :participations

  has_many :administrators, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendees, foreign_key: 'attendee_id', class_name: "Participation"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
