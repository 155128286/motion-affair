class RImageView <UIImageView

  def self.image_view_at(frame, image)
    image_view = RImageView.alloc.initWithImage image
    image_view.frame = frame
    image_view.contentMode = UIViewContentModeScaleAspectFit
    image_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth

    image_view
  end

end