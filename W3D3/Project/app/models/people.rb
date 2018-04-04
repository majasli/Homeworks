#==NO SCHEMA CREATED

# Table name: people
# id        :integer --> creatd
# name      :name
# house_id  :house_id

class People < ActiveRecord::Base
#instead of def People People.find(id)
#its a hash but its not pertinent to put { }
belongs_to  :house
    primary_key: :id,
    foreign_key: :house_id,
    class_name:  :House #symbol or string = 'House'

  # instead of
  # def person_id
  # House.find(self.address)
  # end

end
