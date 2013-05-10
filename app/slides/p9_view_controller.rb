class P9ViewController <RViewController

  TWO_O = [
      'Rubymotion 2.0',
      '- OS X support',
      '- Template for iOS, OS X or RubyGem',
      '- Incoming template for Games based on Cocos2d',
      '- WeakRef.new()',
      '- \'sudo motion update\' unless you.use_rubymine?'
  ]

  LABEL_SIZE = [903, 75]

  def loadView
    super

    @two = generate_two
    @two.each { |label| self.view << label }
  end

  def generate_two
    two = []

    TWO_O.each_with_index { |text, index|
      label = RLabel.bold_label_at [[60, 65 + 83*index], LABEL_SIZE], text, 32
      label.backgroundColor = UIColor.brickRedColor if index == 0
      label.textAlignment = NSTextAlignmentLeft unless index == 0
      label.textColor = :orange.uicolor if index == 5
      two << label
    }

    two
  end

  def swipe_left
    app_delegate.open 'p10'
  end

end