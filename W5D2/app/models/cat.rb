class Cat < ApplicationRecord

  validates :name, presence: true, uniqueness: true, null: false
  include Toyable 
end
