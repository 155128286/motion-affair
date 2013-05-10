class P5ViewController <RViewController

  SECOND_CONTENT = [
      %w(Object NSObject NSString NSMutableString String),
      %w(Object NSObject NSArray NSMutableArray Array),
      %w(Object NSObject NSDictionary NSMutableDictionary Hash),
      %w(ruby_object NSObject NSClass NSClass ruby_class)
  ]

  CONTROL_HEIGHT = 120

  def loadView
    super

    @llvm_ruby = RImageView.image_view_at center_frame_with_size([1024, 1024]), 'llvm_ruby.png'
    @llvm_ruby.alpha = 0.05
    self.view << @llvm_ruby

    content_frame = [[0, 0], [v_width, v_height]]

    @third = UIView.alloc.initWithFrame content_frame
    @third.alpha = 0
    @third.on_tap {
      third_change_content
    }
    self.view << @third

    @third_content = 0
    layout_third

    @second = UIView.alloc.initWithFrame content_frame
    @second.alpha = 0
    @second.on_tap {
      second_change_content
    }
    self.view << @second

    @second_content = 0
    layout_second

    @first = UIView.alloc.initWithFrame content_frame
    @first.alpha = 0
    layout_first
    self.view << @first

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

  def layout_third
    @ruby_code = UIView.alloc.initWithFrame [[49, 172], [376, 122]]
    @ruby_code.alpha = 0.0
    @third << @ruby_code

    @llvm_code = UIView.alloc.initWithFrame [[49, 366], [376, 330]]
    @llvm_code.alpha = 0.0
    @third << @llvm_code

    @assm_code = UIView.alloc.initWithFrame [[480, 172], [500, 778]]
    @assm_code.alpha = 0.0
    @third << @assm_code

    layout_code_sample @ruby_code, '1. Ruby code', 'ruby_code.png'
    layout_code_sample @llvm_code, '2. LLVM bitcode', 'llvm_code.png'
    layout_code_sample @assm_code, '3. Assembly code', 'assembly_code.png'
  end

  def layout_code_sample(code, text, image)
    label = RLabel.bold_label_at [[0, 0], [500, 50]], text, 32
    label.textAlignment = NSTextAlignmentLeft
    image = image.uiimage
    code_view = RImageView.image_view_at [[0, 58], image.size], image
    code << label
    code << code_view
  end

  def third_change_content
    if @third_content < 3
      @third_content += 1
    else
      @third_content = 1
    end

    case @third_content
      when 1
        @ruby_code.change_alpha 1.0
        @llvm_code.change_alpha 0.0
        @assm_code.change_alpha 0.0
      when 2
        @ruby_code.change_alpha 1.0
        @llvm_code.change_alpha 1.0
        @assm_code.change_alpha 0.0
      when 3
        @ruby_code.change_alpha 1.0
        @llvm_code.change_alpha 1.0
        @assm_code.change_alpha 1.0
      else
        # do nothing
    end
  end

  def layout_second
    @labels = generate_labels
    @labels.each_with_index { |label, index|
      change_text label, SECOND_CONTENT[@second_content][index]
      @second << label
    }
  end

  def generate_labels
    labels = []

    5.times do |index|
      label = RLabel.bold_label_at [[210, 170 + index * 108], [600, 100]], '', 50, false
      label.backgroundColor = (index == 0 || index == 4) ? UIColor.brickRedColor : UIColor.infoBlueColor
      label.contentMode = UIViewContentModeCenter
      labels << label
    end

    labels
  end

  def second_change_content
    if @second_content < SECOND_CONTENT.length - 1
      @second_content += 1
    else
      @second_content = 0
    end

    @labels.each_with_index { |label, index|
      change_text label, SECOND_CONTENT[@second_content][index]
    }
  end

  def layout_first
    title = RLabel.bold_label_at [[80, 210], [870, 280]], 'Unified Runtime', 120, true
    obj_c = RLabel.bold_label_at [[140, 540], [340, 120]], 'Objective-C Runtime', 50, true
    ruby  = RLabel.bold_label_at [[550, 540], [340, 120]], 'RubyMotion Runtime', 50, true
    plus  = RLabel.bold_label_at [[460, 540], [120, 120]], '+', 50, true

    title.numberOfLines = 2
    obj_c.numberOfLines = 2
    ruby.numberOfLines  = 2

    @first << title
    @first << obj_c
    @first << ruby
    @first << plus
  end

  def viewDidAppear(animated)
    super
    @segmented_control.move_to [0, 0], lambda {
      @segmented_control.show_initial
      @first.change_alpha 1.0
      @second.alpha = 0.0
      @third.alpha = 0.0
    }
  end

  def valueChanged(sender)
    case @segmented_control.selected_index
      when 0
        @first.change_alpha 1.0
        @second.change_alpha 0.0
        @third.change_alpha 0.0
      when 1
        @first.change_alpha 0.0
        @second.change_alpha 1.0
        @third.change_alpha 0.0
      when 2
        @first.change_alpha 0.0
        @second.change_alpha 0.0
        @third.change_alpha 1.0
      else
        # do nothing
    end
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

  def change_text(label, text)
    animation = CATransition.animation
    animation.duration = 0.25
    animation.type = KCATransitionFade
    animation.timingFunction = CAMediaTimingFunction.functionWithName KCAMediaTimingFunctionEaseInEaseOut
    label.layer.addAnimation animation, forKey:'changeTextTransition'

    label.text = text
  end

end