class User < ApplicationRecord
    validate :email, presence: true, uniqueness: true 
end 