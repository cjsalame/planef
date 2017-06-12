# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise                  :database_authenticatable, :registerable,
                          :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :schools
  has_many :subjects_teachers
  has_many :subjects, through: :subjects_teachers
  has_many :planifications, through: :grades_subjects_teachers
  accepts_nested_attributes_for :subjects_teachers,
                                allow_destroy: true,
                                reject_if: proc { |att| att['id'].blank? }
  validates_associated :subjects_teachers

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
end
