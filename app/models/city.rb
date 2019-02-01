def initize (date)
  ray = date.to_s.split("-")
  ring = ray.join
  num = ring.to_i
end

class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods


  def city_openings(startdate, stopdate)
    start = intize(startdate)
    stop = intize(stopdate)
    emray = []
    self.listings.each do |listing|
      occupied = listing.reservations.any? do |res|
        c_in = res.checkin.to_s.intize 
        c_out = res.checkout.to_s.intize 
        c_in > start && c_in < stop || c_out > start && c_out < stop || c_in < start && c_out > stop 
      end 
      if occupied == false 
        emray << listing 
      end 
    end 
    emray 
  end       

end
