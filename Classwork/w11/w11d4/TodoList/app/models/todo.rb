class Todo < ApplicationRecord
    validates :title, :body, presence: true
    validates :boolean_field_name, inclusion: { in: [true, false] }
end
