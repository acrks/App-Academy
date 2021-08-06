# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    # Add associations for enrollments and enrolled_courses.

    # User.first.enrollments = First users enrollment

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    # User.first.enrolled_courses = First course they're enrolled in

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

end
