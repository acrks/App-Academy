# == Schema Information
#
# Table name: poems
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  stanzas    :string           not null
#  complete   :boolean          not null
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poem < ApplicationRecord
    validates :title, :stanzas, presence: true
    validates :complete, inclusion: [true, false]
    
    attr_accessor :author_id

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
end
