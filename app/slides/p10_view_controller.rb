class P10ViewController <RViewController

  def loadView
    super

    @pit_fall = RImageView.image_view_at center_frame_with_size([512, 512]), 'pitfalls.png'
    @pit_fall.alpha = 0.0
    @pit_fall.on_tap {
      pit_fall_tapped
    }
    self.view << @pit_fall

    @cocoapods = make_image_view 'cocoapods.png'
    self.view << @cocoapods

    @runtime = make_image_view 'runtime_crash_uitextfield.png'
    self.view << @runtime

    @arc_lite = make_image_view 'arc_lite.png'
    self.view << @arc_lite

    @content = 0
  end

  def make_image_view(image)
    image_view = RImageView.image_view_at center_frame_with_size([1024, 768]), image
    image_view.alpha = 0.0
    image_view.on_tap {
      image_view.close_in lambda {
        @pit_fall.pop_out
      }
    }
    image_view
  end

  def pit_fall_tapped
    @pit_fall.close_in lambda {
      case @content
        when 0
          @cocoapods.pop_out
        when 1
          @runtime.pop_out
        when 2
          @arc_lite.pop_out
        else
          # do nothing
      end

      if @content < 2
        @content += 1
      else
        @content = 0
      end
    }
  end

  def viewDidAppear(animated)
    super
    @pit_fall.pop_out unless @pit_fall.alpha == 1
  end

  def swipe_left
    app_delegate.open 'end'
  end

end