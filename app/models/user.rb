class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :validatable
  devise :confirmable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable

  has_one :profile, dependent: :destroy
  has_one :photo, dependent: :destroy
  
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :photo

  validates :password, presence: true, length: {minimum: 8, maximum: 120}, on: :create
  validates :password, length: {minimum: 8, maximum: 120}, on: :update, allow_blank: :true
end
