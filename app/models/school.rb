# School Model
class School < ApplicationRecord
  has_and_belongs_to_many :users
  has_many                :subjects, dependent: :destroy
  has_many                :grades

  validates :name, uniqueness: true
  validates :RBD,  uniqueness: true
  # No es necesario ingresar codigo para creacion de colegio
  validates :code, presence: false
end
