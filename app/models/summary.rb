class Summary < ActiveRecord::Base
belongs_to :restaurant
belongs_to :user
has_many :comments
has_many :favorites
end
