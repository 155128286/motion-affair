class P5ViewController <RViewController

  def loadView
    super

    llvm_ruby = RImageView.image_view_at center_frame_with_size([512, 512]), 'llvm_ruby.png'
    self.view << llvm_ruby
  end

  def swipe_left
    app_delegate.open 'p6'
  end

end