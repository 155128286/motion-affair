class P1ViewController <RViewController

  def loadView
    super

    image_view = RImageView.image_view_at self.view.frame, 'p1'.uiimage
    self.view << image_view
  end

  def swipe_left
    app_delegate.open 'p2'
  end

end