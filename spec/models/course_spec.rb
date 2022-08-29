require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance#methods' do
    it "should be able to count students in a class" do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      stud2 = Student.create!(name: "Saul Whitemon", age: 16, house: "Slytherin")
      stud3 = Student.create!(name: "Haul Whitemon", age: 16, house: "Slytherin")
      
      course1 = Course.create!(name: "Defense against the Dark Arts")

      stud1_course1 = StudentCourse.create!(student_id: stud1.id, course_id: course1.id)
      stud2_course1 = StudentCourse.create!(student_id: stud2.id, course_id: course1.id)
      stud3_course1 = StudentCourse.create!(student_id: stud3.id, course_id: course1.id)

      expect(course1.student_count).to eq(3)
    end

    it 'should find the students in the course' do
      course = Course.create!(name: "Herbology" )

      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      stud2 = Student.create!(name: "Saul Whitemon", age: 14, house: "Slytherin")
      stud3 = Student.create!(name: "Haul Whitemon", age: 18, house: "Slytherin")

      stud1_course1 = StudentCourse.create!(student_id: stud1.id, course_id: course.id)
      stud2_course1 = StudentCourse.create!(student_id: stud2.id, course_id: course.id)
      stud3_course1 = StudentCourse.create!(student_id: stud3.id, course_id: course.id)

      expect(course.alpha_students).to eq [stud3,stud1,stud2]
    end
  end


end
