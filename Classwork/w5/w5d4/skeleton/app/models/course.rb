# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    # Add enrollments and enrolled_students associations

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

# Course.first.enrolled_courses = First course they're enrolled in

    has_many :enrolled_users, 
        through: :enrollments,
        source: :user

# Add an association for prerequisite. This should return a course's prereq (if it has one).

    belongs_to :prerequisite,
        primary_key: :id,
        # Foreign key : What we're looking for in our own table
        foreign_key: :prereq_id,
        class_name: :Course

# Add an instructor association to Course

    belongs_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User
    
end
