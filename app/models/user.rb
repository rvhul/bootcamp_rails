class User < ActiveRecord::Base
  validates(:name, presence: true, length: {maximum: 55})
  VALID_EMAIL_REGEX	=	/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255}, format: VALID_EMAIL_REGEX, uniqueness: {case_sensitive: false})
end
