module LocationsHelper
  def location_color(location)
    Colorizer.colorize(location.id)
  end
end
