class RViewController <UIViewController

  def loadView
    super
    self.view.backgroundColor = self.view.backgroundColor = 0x393939.uicolor

    self.view.on_swipe(direction:UISwipeGestureRecognizerDirectionLeft) { |swipe|
      swipe_left swipe
    }

    self.view.on_swipe(direction:UISwipeGestureRecognizerDirectionRight) { |swipe|
      swipe_right swipe
    }
  end

  def viewWillAppear(animated)
    super
    navigationController.navigationBarHidden = true
  end

  def shouldAutorotateToInterfaceOrientation
    true
  end

  def swipe_left(swipe)
    # this method is meant to be override by subclass
    puts 'swipe left'
  end

  def swipe_right(swipe)
    # this method is meant to be override by subclass
    puts 'swipe right'
  end

  def v_width
    self.view.frame.size.width
  end

  def v_height
    self.view.frame.size.height
  end

end