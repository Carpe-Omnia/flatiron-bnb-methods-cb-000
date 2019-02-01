class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :listings
  has_many :reservations, :through => :listings

  def neighborhood_openings(startdate, stopdate)
    start = intize(startdate)
    stop = intize(stopdate)
    emray = []
    self.listings.each do |listing|
      occupied = listing.reservations.any? do |res|
        c_in = intize(res.checkin.to_s)
        c_out = intize(res.checkout.to_s)
        c_in > start && c_in < stop || c_out > start && c_out < stop || c_in < start && c_out > stop
      end
      if occupied == false
        emray << listing
      end
    end
    emray
  end

end
