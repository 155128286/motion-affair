class P5ViewController <RViewController

  CONTROL_HEIGHT = 120

  def loadView
    super

    @llvm_ruby = RImageView.image_view_at center_frame_with_size([512, 512]), 'llvm_ruby.png'
    self.view << @llvm_ruby

    @segmented_control = RSegmentedControl.alloc.initWithFrame [[0, -CONTROL_HEIGHT], [v_width, CONTROL_HEIGHT]]
    @segmented_control.addTarget self, action:'valueChanged:', forControlEvents:UIControlEventValueChanged
    self.view << @segmented_control
  end

  def viewDidAppear(animated)
    super
    @segmented_control.move_to [0, 0]
  end

  def valueChanged(sender)
    puts @segmented_control.selected_index
  end

  def swipe_left
    @segmented_control.move_to [0, -CONTROL_HEIGHT], lambda {app_delegate.open 'p6'}
  end

  def swipe_right
    @segmented_control.move_to [0, -CONTROL_HEIGHT], lambda {super}
  end

end