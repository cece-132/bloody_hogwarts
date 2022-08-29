class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  def self.average_age
    average(:age)
  end
end
