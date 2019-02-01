class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods


  def city_openings(start, stop)
    startray = start.split("-")
    stopray = stop.split("-")


end
