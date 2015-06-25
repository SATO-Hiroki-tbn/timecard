class User < ActiveRecord::Base
  #after_create :create_user_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users_teams
  has_many :attendances
  has_many :users_roles
  has_many :roles, through: :users_roles
  has_one :user_profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    UsersRole.find_by current_id
  end

  private

  def create_user_profile
    UserProfile.find_or_create_by(user_id: id)
  end


end
