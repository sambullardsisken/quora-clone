class User < ActiveRecord::Base
  attr_accessible :blurb, :password_digest, :session_token, :username
end
