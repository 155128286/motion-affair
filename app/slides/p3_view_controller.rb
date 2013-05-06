class P3ViewController <RViewController

  def loadView
    super

    @lrz_name = RLabel.bold_label_at [[430, 480], [200, 75]], 'Laurent Sansonetti'
    @lrz_name.bold_font_size = 32
    @lrz_name.numberOfLines = 2
    @lrz_name.alpha = 0.0
    self.view << @lrz_name

    @lrz = RImageView.image_view_at [[430, 270], [200, 200]], 'lrz.jpg'.uiimage, true
    @lrz.alpha = 0.0
    @lrz.on_tap {
      @lrz.tapped
      @lrz_name.change_alpha 1.0
    }
    self.view << @lrz

    @watson_name = RLabel.bold_label_at [[680, 480], [200, 75]], 'Watson'
    @watson_name.bold_font_size = 32
    @watson_name.numberOfLines = 2
    @watson_name.alpha = 0.0
    self.view << @watson_name

    @watson = RImageView.image_view_at [[680, 270], [200, 200]], 'watson.jpg'.uiimage, true
    @watson.alpha = 0.0
    @watson.on_tap {
      @watson.tapped
      @watson_name.change_alpha 1.0
    }
    self.view << @watson

    @mac_ruby = layout_icon 'mac_ruby.png', 'MacRuby'
    @mac_ruby.alpha = 0.0
    @mac_ruby.on_tap {
      close
    }
    self.view << @mac_ruby

    @rubymotion = layout_icon 'rubymotion.png', 'Rubymotion'
    @rubymotion.on_tap {
      if @rubymotion.frame.origin.x == 100
        close
      else
        open
      end
    }
    self.view << @rubymotion
  end

  def open
    @rubymotion.move_to [100, 120]
    @mac_ruby.change_alpha 1.0
    @mac_ruby.move_to [100, 390]
    @lrz.pop_out(lambda {|finished| @watson.pop_out})
  end

  def close(completion=nil)
    @rubymotion.move_to center_frame_with_size([200, 235])[0]
    @mac_ruby.change_alpha 0.0
    @mac_ruby.move_to center_frame_with_size([200, 235])[0]
    @lrz.close_in
    @lrz_name.change_alpha 0.0
    @watson.close_in completion
    @watson_name.change_alpha 0.0
  end

  def layout_icon(image_name, text)
    icon = UIView.alloc.initWithFrame center_frame_with_size([200, 235])
    icon.backgroundColor = UIColor.clearColor

    image = RImageView.image_view_at [[10, 10], [180, 180]], image_name.uiimage
    icon << image

    label = RLabel.bold_label_at [[0, 190], [200, 40]], text
    label.bold_font_size = 32
    icon << label

    icon
  end

  def swipe_left
    close(lambda {|finished| app_delegate.open 'p10'})
  end

end