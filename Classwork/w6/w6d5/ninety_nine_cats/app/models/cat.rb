require 'action_view'

class Cat < ApplicationRecord
    # include: ActionView.Helpers.DateHelper
    # age = birth_date.year - Time.now.year
    COLORS = ['Black', 'Brown', 'Blonde', 'Tiger', 'Nude', 'White', 'Ginger']
    validates :birth_date, presence: true
    validates :color, presence: true, :inclusion => {:in => COLORS}
    validates :name, presence: true, uniqueness: true
    validates :sex, presence: true, :inclusion => {:in => ['M', 'F']}
    validates :description, presence: true
    
    # def age=

    # end

end
