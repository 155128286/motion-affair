class P8ViewController <RViewController

  OPEN_SOURCE = [
      'Open Source',
      '* All Ruby part of Rubymotion are Open Source *'
  ]

  WILL_BE = [
      'There will be:',
      '- High level debugging support',
      '- Better toolchain',
      '- Better RubyMine integration'
  ]

  LABEL_SIZE = [903, 75]

  def loadView
    super

    @open_source = generate_open_source
    @open_source.each { |label| self.view << label }

    @will_be = generate_will_be
    @will_be.each { |label| self.view << label }
  end

  def generate_open_source
    open_source = []

    OPEN_SOURCE.each_with_index { |text, index|
      label = RLabel.bold_label_at [[60, 65 + 83*index], LABEL_SIZE], text, 32
      label.backgroundColor = UIColor.successColor if index == 0
      open_source << label
    }

    open_source
  end

  def generate_will_be
    will_be = []

    WILL_BE.each_with_index { |text, index|
      label = RLabel.bold_label_at [[60, 330 + 83*index], LABEL_SIZE], text, 32
      label.backgroundColor = UIColor.orangeColor if index == 0
      label.textAlignment = NSTextAlignmentLeft unless index == 0
      will_be << label
    }

    will_be
  end

  def swipe_left
    app_delegate.open 'p9'
  end

end