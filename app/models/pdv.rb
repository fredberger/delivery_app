class Pdv < ApplicationRecord
  validates_presence_of :tradingName, :ownerName, :document, :coverageArea, :address

  before_save :calculate_geocodes

  def calculate_geocodes
    self.delivery_area = RGeo::GeoJSON.decode(self.coverageArea).as_text
    self.lnglat = RGeo::GeoJSON.decode(self.address).as_text
  end

  def self.search_by_coordinates(lng, lat)
    attend_pdvs = ActiveRecord::Base.connection.execute("
      SELECT ST_Distance('POINT (#{lng} #{lat})', lnglat) as distance, id
      FROM pdvs
      WHERE (
        ST_Intersects('POINT (#{lng} #{lat})', delivery_area)
      )
    ").to_a
    if attend_pdvs.any?
      closest_id = attend_pdvs.min{ |a, b| a["distance"] <=> b["distance"] }["id"]
      Pdv.find(closest_id)
    end
  end
end
