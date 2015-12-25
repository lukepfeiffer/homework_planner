class User < ActiveRecord::Base
  include Authem::User
  has_many :courses
end
