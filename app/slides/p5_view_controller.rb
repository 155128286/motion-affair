class P5ViewController <RViewController

  def loadView
    super

    @llvm_ruby = RImageView.image_view_at center_frame_with_size([512, 512]), 'llvm_ruby.png'
    self.view << @llvm_ruby

    @segmented_control = RSegmentedControl.alloc.initWithFrame [[0, 0], [v_width, 120]]
    @segmented_control.addTarget self, action:'valueChanged:', forControlEvents:UIControlEventValueChanged
    self.view << @segmented_control
  end

  def valueChanged(sender)
    puts @segmented_control.selected_index
  end

  def swipe_left
    app_delegate.open 'p6'
  end

end