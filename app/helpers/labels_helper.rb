module LabelsHelper
  def label_color(label)
    Colorizer.colorize(label)
  end
end
