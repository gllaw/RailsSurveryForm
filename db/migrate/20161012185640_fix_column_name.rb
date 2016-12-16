class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :surveys, :dojo_location, :location
  	rename_column :surveys, :favorite_language, :language
  end
end
