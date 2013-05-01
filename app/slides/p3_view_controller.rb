class P3ViewController <UIViewController

  def loadView
    super

    @web_view = RWebView.web_view_at self.view.bounds
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

end