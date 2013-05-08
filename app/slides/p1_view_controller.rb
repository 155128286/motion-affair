class P1ViewController <RViewController

  def loadView
    super

    image_view = RImageView.image_view_at center_frame_with_size([1024, 760]), 'p1'
    self.view << image_view
  end

  def swipe_left
    app_delegate.open 'p2'
  end

end