class RWebView <UIView

  def self.web_view_at(frame)
    web_view = RWebView.alloc.initWithFrame frame
    web_view
  end

  def initWithFrame(frame)
    if super frame
      self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth

      @shadow_view = UIView.alloc.initWithFrame self.bounds
      @shadow_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
      @shadow_view.backgroundColor = :white.uicolor
      @shadow_view.layer.shadowColor = UIColor.blackColor.CGColor
      @shadow_view.layer.shadowOffset = [0, 0]
      @shadow_view.layer.shadowRadius = 8
      @shadow_view.layer.shadowOpacity = 1.0
      self << @shadow_view

      @web_view = UIWebView.alloc.initWithFrame self.bounds
      @web_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
      self << @web_view
    end

    self
  end

  def load_page(url)
    request = NSURLRequest.alloc.initWithURL NSURL.URLWithString url
    @web_view.loadRequest request
  end

  def set_shadow_path
    @shadow_view.layer.shadowPath = UIBezierPath.bezierPathWithRect(self.bounds).CGPath
  end

end