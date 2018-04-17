module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    # This method should first find or create a toy whose name matches the argument.
    toy = Toy.find_by(name: name)
    self.toys << toy 
    # add it to self
  end
end
