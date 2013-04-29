class RLabel <UILabel

  def self.label_at frame, auto_resize=true
    label = UILabel.alloc.initWithFrame frame
    label.textAlignment = :center.uialignment
    label.font = 'Courier'.uifont 40
    label.textColor = :white.uicolor
    label.backgroundColor = UIColor.clearColor

    if auto_resize
      label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
    end

    label
  end

  def self.bold_label_at frame
    label = RLabel.label_at frame
    label.font = 'Courier-Bold'.uifont 100
    label
  end

end