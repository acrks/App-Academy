# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :session_token, presence:true, uniqueness:true
    validates :password_digest, presence:true
    validates :password, length: { minimum: 6, allow_nil: true}
    attr_reader :password

    # has_many:
    # has_many:

    after_initialize :ensure_session_token
    # spire
    # self.find_by_credentials
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        user.is_password?(password) ? user:nil
    end
    # password=
    def password=
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    # is_password?
    def is_password?
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    # reset_session_token
    def reset_session_token
        self.reset_session_token = SecureRandom.urlsafe_base64
        self.save
        self.session_token
    end
    # ensure_session_token
    def ensure_session_token
        self.reset_session_token ||= SecureRandom.urlsafe_base64
    end   
end
