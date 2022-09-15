class Expert < ApplicationRecord
  has_many :properties

  CITIES = ["paris", "toulouse", "lille", "bordeaux"]
end
