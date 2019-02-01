def initize (date)
  ray = date.to_s.split("-")
  ring = ray.join
  num = ring.to_i 
end   
class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods


  def city_openings(start, stop)
    startray = start.split("-")
    stopray = stop.split("-")
    startray.each do |thing|
      thing = thing.to_i
    end
    stopray.each do |thing|
      thing = thing.to_i
    end


end
