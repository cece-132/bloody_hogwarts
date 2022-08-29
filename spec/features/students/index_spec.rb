require 'rails_helper'

RSpec.describe Student do
  describe 'User Story 1' do
    it 'students#index' do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")

      visit students_path

      within ".students" do
        within "#student-#{stud1.id}" do
          expect(page).to have_content(stud1.name)
          expect(page).to have_content(stud1.age)
          expect(page).to have_content(stud1.house)
        end
      end
    end
  end

  describe 'User Story 4' do
    it 'shows the average age of the students' do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      stud2 = Student.create!(name: "Saul Whitemon", age: 14, house: "Slytherin")
      stud3 = Student.create!(name: "Haul Whitemon", age: 18, house: "Slytherin")

      visit students_path

      within ".students_avg_age" do
        expect(page).to have_content("Average Age: 16")
      end
    end
  end

  describe 'Extension' do
    it 'shows students in alpha order' do
      stud1 = Student.create!(name: "Paul Whitemon", age: 16, house: "Slytherin")
      stud2 = Student.create!(name: "Saul Whitemon", age: 14, house: "Slytherin")
      stud3 = Student.create!(name: "Haul Whitemon", age: 18, house: "Slytherin")

      visit students_path

      within ".students" do
        expect(stud3.name).to appear_before(stud1.name)
        expect(stud1.name).to appear_before(stud2.name)
        expect(stud2.name).to_not appear_before(stud3.name)
      end
    end
  end
end