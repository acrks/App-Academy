# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  video_id     :integer          not null
#  parent_comment_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#

class Comment < ApplicationRecord

  belongs_to :commenter,
    foreign_key: :commenter_id,
    class_name: :User
  
  belongs_to :video,
    foreign_key: :video_id,
    class_name: :Video

  belongs_to :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: :Comment,
    optional: true

  has_many :replies,
    foreign_key: :parent_comment_id,
    class_name: :Comment

  has_one :parent_commenter,
    through: :parent_comment,
    source: :commenter
  
end
