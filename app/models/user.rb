class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services

  before_create do
    self.trial_ends_at = 7.days.from_now
  end

  def on_trial?
    Time.current < trial_ends_at
  end
end
