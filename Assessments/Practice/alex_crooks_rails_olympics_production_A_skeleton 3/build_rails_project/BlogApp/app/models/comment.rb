# == Schema Information
#
# Table name: comments
#
#  id        :bigint           not null, primary key
#  body      :string           not null
#  author_id :integer          not null
#  blog_id   :integer          not null
#
class Comment < ApplicationRecord
    validates :body, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :blog,
        foreign_key: :blog_id,
        class_name: :Blog
end
