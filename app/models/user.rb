# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise                  :database_authenticatable, :registerable,
                          :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :schools
  has_many :subjects_teachers
  has_many :subjects, through: :subjects_teachers
  accepts_nested_attributes_for :subjects_teachers,
                                allow_destroy: true,
                                reject_if: proc { |att| att['id'].blank? }
  validates_associated :subjects_teachers
end
