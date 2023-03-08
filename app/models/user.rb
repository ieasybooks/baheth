class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Removed: :recoverable, :registerable
  # Added: :trackable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_many :speakers, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :media, dependent: :destroy
  has_many :cues, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
