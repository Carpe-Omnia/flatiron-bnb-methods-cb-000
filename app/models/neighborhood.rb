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

  def self.highest_ratio_res_to_listings
    emray = ["",0]
    self.all.each do |hood|
      list = hood.listings.size
      res = hood.reservations.size
      ratio = res / list
      if ratio > emray[1]
        emray = [hood, ratio]
      end
    end
    emray[0]
  end

  def self.most_res
    emray = ["",0]
    self.all.each do |hood|
      res = hood.reservations.size
      if res > emray[1]
        emray = [hood, res]
      end
    end
    emray[0]
  end


end
