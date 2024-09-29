class Game < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :opponent, class_name: "User", optional: true
end
