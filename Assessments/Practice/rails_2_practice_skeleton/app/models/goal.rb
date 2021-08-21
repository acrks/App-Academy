# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  details    :string           not null
#  status     :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :details, presence: true
    # validates :status, inclusion: [true, false]

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
end
