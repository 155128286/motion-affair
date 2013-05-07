class UIView

  def move_to(point, completion=nil)
    UIView.animateWithDuration 0.3, animations:lambda {
      self.frame = [point, self.frame.size]
    }, completion:lambda { |finished|
      completion.call() unless completion.nil?
    }
  end

  def change_alpha(alpha, completion=nil)
    UIView.animateWithDuration 0.3, animations:lambda {
      self.alpha = alpha
    }, completion:lambda { |finished|
      completion.call() unless completion.nil?
    }
  end


  ENLARGE_FACTOR = 1.2
  SMALL_FACTOR = 0.01

  def pop_out(completion=nil)
    self.transform = CGAffineTransformMakeScale(SMALL_FACTOR, SMALL_FACTOR)
    self.change_alpha 1.0
    tapped 0.3, completion
  end

  def close_in(to_point=nil, completion=nil)
    old_frame = self.frame
    UIView.animateWithDuration(0.1, animations:lambda {
      self.frame = [to_point, self.frame.size] unless to_point.nil?
      self.transform = CGAffineTransformMakeScale(ENLARGE_FACTOR, ENLARGE_FACTOR)
    }, completion:lambda {|finished|
      if finished
        UIView.animateWithDuration(0.3, animations:lambda {
          self.transform = CGAffineTransformMakeScale(SMALL_FACTOR, SMALL_FACTOR)
          self.change_alpha 0.0
        }, completion:lambda { |finished|
          self.transform = CGAffineTransformIdentity
          self.frame = old_frame
          completion.call() unless completion.nil?
        })
      end
    })
  end

  def tapped(duration=0.1, completion=nil)
    UIView.animateWithDuration(duration, animations:lambda {
      self.transform = CGAffineTransformMakeScale(ENLARGE_FACTOR, ENLARGE_FACTOR)
    }, completion:lambda {|finished|
      if finished
        UIView.animateWithDuration(0.1, animations:lambda {
          self.transform = CGAffineTransformIdentity
        }, completion:lambda { |finished|
          completion.call() unless completion.nil?
        })
      end
    })
  end

end