class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :course_users
  has_many :courses, through: :course_users

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  def self.search(query)
    where("first_name ILIKE ? OR last_name ILIKE ?", "%#{query}%","%#{query}%")
  end

  def admin?
    role == "Admin"
  end
end
