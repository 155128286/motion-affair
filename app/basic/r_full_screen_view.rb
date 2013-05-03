class RFullScreenView <UIView

  attr_accessor :next
  attr_accessor :previous

  def initWithFrame(frame)
    if super frame
      self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
      self.on_swipe(direction:UISwipeGestureRecognizerDirectionRight) { |swipe|
        self.previous.call() unless self.previous.nil?
      }
    end
    self
  end

end