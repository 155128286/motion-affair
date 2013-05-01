class P0ViewController <RViewController

  def loadView
    super

    title = RLabel.bold_label_at [[0, 200], [v_width, 200]], 'RubyMotion'
    self.view << title

    sub_title = RLabel.label_at [[0, 400], [v_width, 100]], 'Make baby with Objective-C'
    self.view << sub_title

    sub_title2 = RLabel.label_at [[0, 500], [v_width, 100]], 'Make love with RubyMotion'
    self.view << sub_title2
  end

  def swipe_left
    app_delegate.open 'p1'
  end

end