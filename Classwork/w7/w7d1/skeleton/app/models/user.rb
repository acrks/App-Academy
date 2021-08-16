class User < ApplicationRecord
    validates_presence_of :username, :password_digest, :session_token
    validates_uniqueness_of :username, :session_token
    validates :password, length: {minimum: 6}, allow_nil: true

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end


end
