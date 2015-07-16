class Restaurant < ActiveRecord::Base

has_many :votes, dependent: :destroy
has_many :comments, dependent: :destroy

validates :name, :address, :city, :state, :zip, presence: :true
validates :zip, numericality: {only_integer: true}
paginates_per 5

  def self.search(query)
     where( "name LIKE :query OR address LIKE :query OR city LIKE :query OR state LIKE :query", query: "%#{query}%")

  end

end
