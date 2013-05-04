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

end