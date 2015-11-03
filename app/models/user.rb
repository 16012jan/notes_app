class User < ActiveRecord::Base
  has_many :notes

  validates :login, :full_name, :name, presence: true
  validates :login, :full_name, :name, length: { minimum: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
