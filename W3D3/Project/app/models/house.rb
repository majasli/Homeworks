#==NO SCHEMA CREATED

# Table name: house
# id       :integer --> created
# address   : string
class People < ActiveRecord::Base

  has_many :residents
    primary_key:  :id
    foreign_key:  :house_id
    class_name:   :Person

end
