class P6ViewController <RViewController

  METHODS = %w(each each_with_index to_s to_a nil? [] %w() 5.times puts __LINE__ << array+array empty? end_with? downcase string+string)
  ADIEUS = [
      'Say adieu to:',
      '- require',
      '- eval() of string',
      '- Proc#binding',
      '- Overriding of operators on Fixnum and Float'
  ]

  def loadView
    super

    @methods = generate_methods
    @methods.each { |method| self.view << method }

    @ruby_style = RLabel.bold_label_at center_frame_with_size([800, 300]), 'oppa_ruby_style', 100, true
    @ruby_style.bold_font_size = 80
    @ruby_style.textColor = :red.uicolor
    @ruby_style.alpha = 0.0
    @ruby_style.on_tap {
      @ruby_style.tapped
    }
    self.view << @ruby_style

    @adieus = generate_adieus
    @adieus.each { |adieu| self.view << adieu }

    self.view.on_tap {
      if @ruby_style.alpha == 1.0
        show_adieus
      else
        @ruby_style.pop_out
      end
    }
  end

  def generate_adieus
    adieus = []

    ADIEUS.each_with_index { |adieu, index|
      label = RLabel.bold_label_at [[80, 487 + index*45], [865, 37]], adieu, 32
      label.alpha = 0.0
      label.textAlignment = NSTextAlignmentLeft
      label.font = 'Courier-BoldOblique'.uifont 32 unless index == 0
      label.textColor = UIColor.infoBlueColor if index == 0
      adieus << label
    }

    adieus
  end

  def generate_methods
    methods = []

    display = METHODS * 2
    display.each_with_index { |method, index|
      x = index/8 * 300
      y = index%8 * 40
      size = method.sizeWithFont RLabel.bold_font

      label = RLabel.bold_label_at [[x, y], size], method, 32
      label.alpha = 0
      methods << label
    }

    methods
  end

  def viewDidAppear(animated)
    super

    @methods.each_with_index { |method, index|
      block = lambda { method.change_alpha 0.5 }
      performSelector('show_label:', withObject:block, afterDelay:index*0.1)
    }
  end

  def show_adieus
    @adieus.each_with_index { |adieu, index|
      block = lambda { adieu.change_alpha 1.0 }
      performSelector('show_label:', withObject:block, afterDelay:index*0.2)
    }
  end

  def show_label(block)
    block.call()
  end

  def swipe_left
    app_delegate.open 'p7'
  end

end