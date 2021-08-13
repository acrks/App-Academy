# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class Restaurant < ApplicationRecord
  belongs_to :owner,
    foreign_key: :owner_id,
    class_name: :User

    has_many :dishes,
        foreign_key: :restaurant_id,
        class_name: :Dish 

    has_many :reviews,
        foreign_key: :restaurant_id,
        class_name: :Review

    has_many :customers_reviewed,
        through: :reviews,
        source: :reviewer
end
