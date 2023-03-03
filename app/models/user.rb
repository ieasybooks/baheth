class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Removed: :recoverable, :registerable
  # Added: :trackable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
end
