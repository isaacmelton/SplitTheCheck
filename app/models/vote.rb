class Vote < ActiveRecord::Base
belongs_to :restaurant
belongs_to :user

def self.yes_votes(restaurant)  
Vote.where(:restaurantID => restaurant, :split => true).count 
end

def self.no_votes(restaurant)  
Vote.where(:restaurantID => restaurant, :split => false).count 
end

end
