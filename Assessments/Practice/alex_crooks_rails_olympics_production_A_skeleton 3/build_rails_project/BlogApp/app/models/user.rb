# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  email :string           not null
#
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true

    has_many :blogs,
        foreign_key: :author_id,
        class_name: :Blog

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment

    has_many :comments_on_blogs,
        through: :blogs,
        source: :comments

    has_many :blogs_commented_on,
        through: :comments,
        source: :blog
end
