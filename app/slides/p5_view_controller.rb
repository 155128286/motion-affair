class P5ViewController <RViewController

  CONTROL_HEIGHT = 120

  def loadView
    super

    @llvm_ruby = RImageView.image_view_at center_frame_with_size([1024, 1024]), 'llvm_ruby.png'
    @llvm_ruby.alpha = 0.05
    self.view << @llvm_ruby

    @segmented_control = RSegmentedControl.alloc.initWithFrame [[0, -CONTROL_HEIGHT], [v_width, CONTROL_HEIGHT]]
    @segmented_control.addTarget self, action:'valueChanged:', forControlEvents:UIControlEventValueChanged
    @segmented_control.first_long_text = 'it\'s a runtime'
    @segmented_control.first_short_text = 'runtime'
    @segmented_control.second_long_text = 'an implementation of ruby'
    @segmented_control.second_short_text = 'ruby'
    @segmented_control.third_long_text = 'it\'s also a compiler'
    @segmented_control.third_short_text = 'compiler'
    self.view << @segmented_control
  end

  def viewDidAppear(animated)
    super
    @segmented_control.move_to [0, 0], lambda {@segmented_control.show_text}
  end

  def valueChanged(sender)
    puts @segmented_control.selected_index
  end

  def swipe_left
    @segmented_control.move_to [0, -CONTROL_HEIGHT], lambda {app_delegate.open 'p6'}
  end

  def swipe_right
    @segmented_control.move_to [0, -CONTROL_HEIGHT], lambda {
      @segmented_control.select 0
      super
    }
  end

end