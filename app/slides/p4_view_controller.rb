class P4ViewController <RViewController

  def loadView
    super

    @ever_clip_name = app_name_at [170, 390], 'EverClip'
    @ever_clip = apps_at [170, 200], 'ever_clip.jpeg'
    @ever_clip.on_tap {
      @ever_clip.tapped
      @ever_clip_name.change_alpha 1.0
    }
    self.view << @ever_clip_name
    self.view << @ever_clip

    @basecamp_name = app_name_at [425, 390], 'Basecamp'
    @basecamp = apps_at [425, 200], 'basecamp.jpeg'
    @basecamp.on_tap {
      @basecamp.tapped
      @basecamp_name.change_alpha 1.0
    }
    self.view << @basecamp_name
    self.view << @basecamp

    @xyq_name = app_name_at [680, 390], 'XYQ'
    @xyq = apps_at [680, 200], 'xyq.jpeg'
    @xyq.on_tap {
      @xyq.tapped
      @xyq_name.change_alpha 1.0
    }
    self.view << @xyq_name
    self.view << @xyq
  end

  def viewDidAppear(animated)
    super
    @ever_clip.pop_out lambda{
      @basecamp.pop_out lambda{
        @xyq.pop_out
      }
    }
  end

  def swipe_left
    @ever_clip_name.change_alpha 0.0
    @basecamp_name.change_alpha 0.0
    @xyq_name.change_alpha 0.0

    @xyq.close_in lambda{
      @basecamp.close_in lambda {
        @ever_clip.close_in lambda {
          app_delegate.open 'p5'
        }, 0.2
      }, 0.2
    }, 0.2
  end

  def apps_at(origin, name)
    app = RImageView.image_view_at [origin, [175, 175]], name, true, 30.0
    app.alpha = 0.0
    app
  end

  def app_name_at(origin, name)
    label = RLabel.bold_label_at [origin, [175, 75]], name
    label.bold_font_size = 32
    label.alpha = 0.0
    label
  end

end