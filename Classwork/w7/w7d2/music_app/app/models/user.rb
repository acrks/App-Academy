class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true}
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true

    attr_reader :password

    after_initialize :ensure_session_token

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end
    
    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def self.generate_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
end
