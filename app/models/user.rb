class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum :profile, {
  normal: 0,
  executive: 1,
  supervisor: 2,
  administrator: 3
  }

  validates :name, presence: true
  validates :lastname, presence: true
  has_many :user_comments
  has_many :tickets, through: :user_comments
  has_many :user_resolutions
  has_many :resolutions, through: :user_resolutions


end
