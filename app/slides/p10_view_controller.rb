class P10ViewController <RViewController

  def loadView
    super

    @web_view = RWebView.web_view_at self.view.bounds
    @web_view.next = lambda { swipe_left }
    @web_view.previous = lambda { swipe_right }
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
    app_delegate.open 'end'
  end

end