class User < ActiveRecord::Base
  include Authem::User
  has_many :courses
  has_many :homeworks, through: :courses
end
