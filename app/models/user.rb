class User < ApplicationRecord
  has_many :created_games, foreign_key: :creator_id, class_name: "Game"
  has_many :joined_games, foreign_key: :opponent_id, class_name: "Game"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
