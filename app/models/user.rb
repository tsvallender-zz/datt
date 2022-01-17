class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :notes, dependent: :destroy
  has_many :todos, dependent: :destroy
end
