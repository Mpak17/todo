class Project < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
