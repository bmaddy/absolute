class User < ActiveRecord::Base

  # Connects this user object to Blacklights Bookmarks. 
  include Blacklight::User
  # Connects this user object to Sufia behaviors. 
  include Sufia::User
  # Connects this user object to Curate User behaviors.
  include Curate::UserBehavior
  # Connects this user object to Hydra behaviors. 
  include Hydra::User
  # Connects this user object to Role-management behaviors.
  include Hydra::RoleManagement::UserRoles


  attr_accessible :email, :password, :password_confirmation if Rails::VERSION::MAJOR < 4

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end
end