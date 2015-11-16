class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :validatable
  devise :confirmable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable

  has_one :profile, dependent: :destroy
  has_many :matches
  has_many :relationships
  
  accepts_nested_attributes_for :profile

  validates_presence_of :username
  validates_uniqueness_of :email, :username

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  validates :password, presence: true, length: {minimum: 8, maximum: 120}, on: :create
  validates :password, length: {minimum: 8, maximum: 120}, on: :update, allow_blank: :true
  
end
