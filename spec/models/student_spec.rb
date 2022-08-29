require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'model#methods' do
    it 'can find the avg age of all students' do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      stud2 = Student.create!(name: "Saul Whitemon", age: 14, house: "Slytherin")
      stud3 = Student.create!(name: "Haul Whitemon", age: 18, house: "Slytherin")

      students = [stud1,stud2,stud3]

      expect(Student.average_age).to eq 16
    end
  end
end
