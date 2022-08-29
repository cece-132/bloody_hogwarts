require 'rails_helper'

RSpec.describe Course do
  describe 'User Story 3' do
    it 'course#index' do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      
      course1 = Course.create!(name: "Defense against the Dark Arts")
      course2 = Course.create!(name: "Herbology" )
      course3 = Course.create!(name: "Potions" )

      stud1_course1 = StudentCourse.create!(student_id: stud1.id, course_id: course1.id)
      stud1_course2 = StudentCourse.create!(student_id: stud1.id, course_id: course2.id)
      stud1_course3 = StudentCourse.create!(student_id: stud1.id, course_id: course3.id)

      visit courses_path

      within ".courses" do
        within "#course-#{course1.id}" do
          expect(page).to have_content("#{course1.name}: 1")
        end
      end

    end
    
  end

  describe 'Extension' do
    it 'has courses in alpha order' do
      course3 = Course.create!(name: "Potions" )
      course1 = Course.create!(name: "Defense against the Dark Arts")
      course2 = Course.create!(name: "Herbology" )

      visit '/courses'

      within '.courses' do
        expect(course1.name).to appear_before(course2.name)
        expect(course2.name).to appear_before(course3.name)
        expect(course3.name).to_not appear_before(course1.name)
      end
    end

    it 'lists students in class in alpha order' do
      course = Course.create!(name: "Herbology" )

      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      stud2 = Student.create!(name: "Saul Whitemon", age: 14, house: "Slytherin")
      stud3 = Student.create!(name: "Haul Whitemon", age: 18, house: "Slytherin")

      stud1_course1 = StudentCourse.create!(student_id: stud1.id, course_id: course.id)
      stud2_course1 = StudentCourse.create!(student_id: stud2.id, course_id: course.id)
      stud3_course1 = StudentCourse.create!(student_id: stud3.id, course_id: course.id)

      visit courses_path

      within ".courses" do
        within "#course-#{course.id}" do
          expect(stud3.name).to appear_before(stud1.name)
          expect(stud1.name).to appear_before(stud2.name)
          expect(stud2.name).to_not appear_before(stud3.name)
        end
      end
    end
  end
end