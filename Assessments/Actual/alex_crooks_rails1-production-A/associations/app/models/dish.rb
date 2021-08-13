# == Schema Information
#
# Table name: dishes
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  description   :text             not null
#  restaurant_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dish < ApplicationRecord
    belongs_to :restaurant,
        foreign_key: :restaurant_id,
        class_name: :Restaurant

    has_many :cart_items,
        foreign_key: :dish_id,
        class_name: :CartItem
end
