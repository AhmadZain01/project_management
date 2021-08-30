class Manager < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  rolify
  ROLES = [:admin, :manager, :employee]
  belongs_to :role, optional: true
end
