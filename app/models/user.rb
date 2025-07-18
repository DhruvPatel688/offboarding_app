class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offboardings, foreign_key: :created_by_id
  has_many :employees, foreign_key: "created_by_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
