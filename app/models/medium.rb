class Medium < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  has_many :speakers, through: :playlist
end
