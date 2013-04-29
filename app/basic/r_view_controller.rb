class RViewController <UIViewController

  def loadView
    super
    self.view.backgroundColor = 0x393939.uicolor

    self.view.on_swipe(direction:UISwipeGestureRecognizerDirectionLeft) { |swipe|
      swipe_left
    }

    self.view.on_swipe(direction:UISwipeGestureRecognizerDirectionRight) { |swipe|
      swipe_right
    }

    self.view.on_tap { |tap|
      swipe_left
    }
  end

  def viewWillAppear(animated)
    super
    navigationController.navigationBarHidden = true
  end

  def shouldAutorotateToInterfaceOrientation
    true
  end

  def app_delegate
    UIApplication.sharedApplication.delegate
  end

  def swipe_left
    # this method is meant to be overridden by subclass
    puts 'swipe left'
  end

  def swipe_right
    puts 'swipe right'
    app_delegate.pop
  end

  def v_width
    self.view.frame.size.width
  end

  def v_height
    self.view.frame.size.height
  end

end