# == Schema Information
#
# Table name: gardens
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  size            :integer          not null
#  garden_owner_id :integer          not null
#
class Garden < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :garden_owner_id}
    validates :size, presence: true

    belongs_to :garden_owner,
        foreign_key: :garden_owner_id,
        class_name: :User
    
    has_many :flowers,
        foreign_key: :garden_id,
        class_name: :Flower
end
