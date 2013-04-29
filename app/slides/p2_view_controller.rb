class P2ViewController <RViewController

  def loadView
    super

    view_frame = [[30, 30], [v_width-60, v_height-60]]

    @shadow_view = UIView.alloc.initWithFrame view_frame
    @shadow_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
    @shadow_view.backgroundColor = :white.uicolor
    @shadow_view.layer.shadowColor = UIColor.blackColor.CGColor
    @shadow_view.layer.shadowOffset = [0, 0]
    @shadow_view.layer.shadowRadius = 8
    @shadow_view.layer.shadowOpacity = 1.0
    self.view << @shadow_view

    @request = NSURLRequest.alloc.initWithURL NSURL.URLWithString 'http://rubymotion-wrappers.com/'
    @web_view = UIWebView.alloc.initWithFrame view_frame
    @web_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
    self.view << @web_view
  end

  def viewWillAppear(animated)
    super
    @shadow_view.layer.shadowPath = UIBezierPath.bezierPathWithRect(@shadow_view.bounds).CGPath
  end

  def viewDidAppear(animated)
    super
    @web_view.loadRequest @request
  end

end