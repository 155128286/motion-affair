class RLabel <UILabel

  def self.label_at(frame, text, font_size=40, shadow=false)
    label = RLabel.alloc.initWithFrame frame
    label.text = text
    label.textAlignment = :center.uialignment
    label.font = 'Courier'.uifont font_size
    label.textColor = :white.uicolor
    label.backgroundColor = UIColor.clearColor

    if shadow
      label.shadowColor = :black.uicolor
      label.shadowOffset = [0, 2]
    end

    label
  end

  def self.bold_label_at(frame, text, font_size=100, shadow=false)
    label = RLabel.label_at frame, text, font_size, shadow
    label.font = 'Courier-Bold'.uifont font_size
    label
  end

  def self.font
    'Courier'.uifont 40
  end

  def self.bold_font
    'Courier'.uifont 32
  end

  def font_size=(size)
    self.font = 'Courier'.uifont size
  end

  def bold_font_size=(size)
    self.font = 'Courier-Bold'.uifont size
  end

end