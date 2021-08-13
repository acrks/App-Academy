class Cat < ApplicationRecord
    validates :birth_date, presence: true
    validates :color, presence: true, :inclusion => {:in => %w('Black', 'Brown', 'Blonde', 'Tiger', 'Nude', 'White', 'Ginger')}
    validates :name, presence: true
    validates :sex, presence: true, :inclusion => {:in => %w('M', 'F')}
    validates :description, presence: true

    


end
