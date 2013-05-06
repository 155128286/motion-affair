class RWebView <RFullScreenView

  def self.web_view_at(frame)
    web_view = RWebView.alloc.initWithFrame frame
    web_view
  end

  def initWithFrame(frame)
    if super frame
      @web_view = UIWebView.alloc.initWithFrame self.bounds
      @web_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
      self << @web_view

      back_button = UIButton.custom
      back_button.frame = [[20, 20], [50, 50]]
      back_button.setImage('back.png'.uiimage, forState:UIControlStateNormal)
      back_button.on(:touch) {
        @web_view.goBack
      }
      self << back_button
    end

    self
  end

  def load_page(url)
    request = NSURLRequest.alloc.initWithURL NSURL.URLWithString url
    @web_view.loadRequest request
  end

end