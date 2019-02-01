class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review

  validates :checkin, presence: true
  validates :checkout, presence: true

  validate :check_in 


  private 

  def check_in 
    if !self.listing.neighborhood.neighborhood_openings(checkin, checkin).include?(self) 
      errors.add(:checkin, "not available at check in")  
    end 
    if checkout == checkin 
      errors.add(:checkin, "checkin and checkout can't be the same day")
    end 
      
  end      
end
