# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :description, :moderator_id, presence: true

    # attr_reader :moderator_id
    # ^ For some reason this is not needed.

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post
end
