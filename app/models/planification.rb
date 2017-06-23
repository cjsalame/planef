# Planification Model
class Planification < ApplicationRecord
  has_many :lectures, dependent: :destroy
  has_many :reviews
  belongs_to :grades_subjects_teacher

  accepts_nested_attributes_for :lectures
  after_initialize :set_defaults, unless: :persisted?
  after_commit :send_email, if: Proc.new { |record|  record.previous_changes.key?(:state) && record.previous_changes[:state].first != record.previous_changes[:state].last }

  def author_name
    @user = User.find(author_id)
    "#{@user.name} #{@user.lastname}"
  end

  def owner_name
    @user = User.find(owner)
    "#{@user.name} #{@user.lastname}"
  end

  def avg_rating
    if reviews.any?
      reviews.average(:rating).round(2)
    else
      0
    end
  end

  def send_email
    self.state ? CheckMailer.utp_to_prof_email(self).deliver_later : CheckMailer.prof_to_utp_email(self).deliver_later
  end

  def set_defaults
    self.rating ||= 0
    self.downloads ||= 0
  end

  def self.search(search)
    # if search
    #   where(['name LIKE ?', "%#{search}%"])
    # else
    #   all
    # end
    plans = Planification.all
    plans = plans.where(['name LIKE ?', "%#{search[:keywords]}%"]) if search[:keywords]
    plans = plans.where(['subject LIKE ?', "%#{search[:subject]}%"]) if search[:subject]
    plans = plans.where(['school LIKE ?', "%#{search[:school]}%"]) if search[:school]
    plans = plans.where(['grade LIKE ?', "%#{search[:grade]}%"]) if search[:grade]
    plans
  end
end
