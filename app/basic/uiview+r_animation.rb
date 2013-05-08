class UIView

  def move_to(point)
    UIView.animateWithDuration 0.3, animations:lambda {
      self.frame = [point, self.frame.size]
    }
  end

  def change_alpha(alpha)
    UIView.animateWithDuration 0.3, animations:lambda {
      self.alpha = alpha
    }
  end

  ENLARGE_FACTOR = 1.2
  SMALL_FACTOR = 0.01

  def pop_out(completion=nil)
    self.transform = CGAffineTransformMakeScale(SMALL_FACTOR, SMALL_FACTOR)
    self.change_alpha 1.0
    tapped completion, 0.3
  end

  def close_in(completion=nil)
    UIView.animateWithDuration(0.1, animations:lambda {
      self.transform = CGAffineTransformMakeScale(ENLARGE_FACTOR, ENLARGE_FACTOR)
    }, completion:lambda {|finished|
      if finished
        UIView.animateWithDuration(0.3, animations:lambda {
          self.transform = CGAffineTransformMakeScale(SMALL_FACTOR, SMALL_FACTOR)
          self.change_alpha 0.0
        }, completion:completion)
      end
    })
  end

  def tapped(completion=nil, duration=0.1)
    UIView.animateWithDuration(duration, animations:lambda {
      self.transform = CGAffineTransformMakeScale(ENLARGE_FACTOR, ENLARGE_FACTOR)
    }, completion:lambda {|finished|
      if finished
        UIView.animateWithDuration(0.1, animations:lambda {
          self.transform = CGAffineTransformIdentity
        }, completion:completion)
      end
    })
  end

end