require 'rails_helper'

RSpec.describe Student do
  describe 'User Story 2' do
    it 'students#show' do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      
      course1 = Course.create!(name: "Defense against the Dark Arts")
      course2 = Course.create!(name: "Herbology" )
      course3 = Course.create!(name: "Potions" )

      stud1_course1 = StudentCourse.create!(student_id: stud1.id, course_id: course1.id)
      stud1_course2 = StudentCourse.create!(student_id: stud1.id, course_id: course2.id)
      stud1_course3 = StudentCourse.create!(student_id: stud1.id, course_id: course3.id)

      visit student_path(stud1)

      within ".courses" do
        expect(page).to have_content(course1.name)
        expect(page).to have_content(course2.name)
        expect(page).to have_content(course3.name)
      end

    end
  end
end