class Library < ActiveRecord::Base
  belongs_to :user
  has_many :books
end
