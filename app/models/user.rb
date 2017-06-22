# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :avatar_file
  after_save :save_avatar, if: :avatar_file
  devise                  :database_authenticatable, :registerable,
                          :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :schools
  has_many :subjects_teachers
  has_many :subjects, through: :subjects_teachers
  has_many :planifications, through: :grades_subjects_teachers
  has_many :reviews
  # accepts_nested_attributes_for :subjects_teachers,
  #                               allow_destroy: true,
  #                               reject_if: proc { |att| att['id'].blank? }
  # validates_associated :subjects_teachers

  def save_avatar
    filename = avatar_file.original_filename
    folder = "app/assets/images/users/#{id}/avatar"
    FileUtils.mkdir_p folder
    f = File.open File.join(folder, filename), 'wb'
    f.write avatar_file.read
    f.close

    self.avatar_file = nil
    update avatar: filename
  end
end
