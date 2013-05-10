class RViewController <UIViewController

  def loadView
    super
    self.view.backgroundColor = UIColor.viewFlipsideBackgroundColor

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
    1024
  end

  def v_height
    768
  end

  def center_frame_with_size(size)
    [[(v_width-size[0])/2, (v_height-size[1])/2], size]
  end

end