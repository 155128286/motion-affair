class P2ViewController <RViewController

  def loadView
    super

    view_frame = [[30, 30], [v_width-60, v_height-60]]
    @web_view = RWebView.web_view_at view_frame
    self.view << @web_view
  end

  def viewWillAppear(animated)
    super
    @web_view.set_shadow_path
  end

  def viewDidAppear(animated)
    super
    @web_view.load_page 'http://rubymotion-wrappers.com/'
  end

  def swipe_left
    app_delegate.open 'p3'
  end

end