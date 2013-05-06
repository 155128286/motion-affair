class RImageView <UIView

  BORDER = 10.0

  def self.image_view_at(frame, image, rounded=false)
    container = RImageView.alloc.initWithFrame frame

    image_view = UIImageView.alloc.initWithImage image
    image_view.frame = [[0, 0], frame[1]]
    image_view.contentMode = UIViewContentModeScaleAspectFit
    container << image_view

    if rounded
      radius = [frame[1][0], frame[1][1]].min/2

      container.backgroundColor = :white.uicolor
      container.layer.masksToBounds = true
      container.layer.cornerRadius = radius

      image_view.frame = [[BORDER, BORDER], [frame[1][0]-BORDER*2, frame[1][1]-BORDER*2]]
      image_view.contentMode = UIViewContentModeScaleAspectFill
      image_view.layer.masksToBounds = true
      image_view.layer.cornerRadius = radius - BORDER
    end

    container
  end

end