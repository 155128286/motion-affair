class RLabel <UILabel

  def self.label_at(frame, text)
    label = RLabel.alloc.initWithFrame frame
    label.text = text
    label.textAlignment = :center.uialignment
    label.font = 'Courier'.uifont 40
    label.textColor = :white.uicolor
    label.backgroundColor = UIColor.clearColor

    label
  end

  def self.bold_label_at(frame, text)
    label = RLabel.label_at frame, text
    label.font = 'Courier-Bold'.uifont 100
    label
  end

  def font_size=(size)
    self.font = 'Courier'.uifont size
  end

  def bold_font_size=(size)
    self.font = 'Courier-Bold'.uifont size
  end

end