class AddSpatialColumnsToPdvs < ActiveRecord::Migration[5.2]
  def change
    add_column :pdvs, :delivery_area, :geometry
    add_column :pdvs, :lnglat, :st_point, geographic: true
  end
end
