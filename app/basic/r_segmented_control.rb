class RSegmentedControl <UIControl

  attr_accessor :selected_index
  attr_accessor :first_long_text, :first_short_text
  attr_accessor :second_long_text, :second_short_text
  attr_accessor :third_long_text, :third_short_text

  VISUAL_OFFSET = 0
  ANIMATION_OFFSET = 10
  OFFSET_DURATION = 0.15

  FIRST = 0
  SECOND = 1
  THIRD = 2

  def initWithFrame(frame)
    if super frame
      @long_width = r_width(frame)/2
      @short_width = @long_width/2

      @selected_index = 0

      @first = UIView.alloc.initWithFrame [[0, 0], [@long_width, r_height(self.frame)]]
      @first.backgroundColor = UIColor.infoBlueColor
      @first.on_tap {
        select FIRST
      }
      self << @first

      @first_label = RLabel.bold_label_at [[0, 0], [@long_width, r_height(self.frame)]], self.first_long_text, 28, true
      @first_label.contentMode = UIViewContentModeCenter
      self << @first_label

      @third = UIView.alloc.initWithFrame [[@long_width, 0], [@long_width, r_height(self.frame)]]
      @third.backgroundColor = UIColor.orangeColor
      @third.on_tap {
        select THIRD
      }
      self << @third

      @third_label = RLabel.bold_label_at [[@long_width + @short_width, 0], [@short_width, r_height(self.frame)]], self.third_short_text, 28, true
      @third_label.contentMode = UIViewContentModeCenter
      self << @third_label

      @second = UIView.alloc.initWithFrame [[@long_width - ANIMATION_OFFSET, 0], [@short_width, r_height(self.frame)+VISUAL_OFFSET]]
      @second.backgroundColor = UIColor.brickRedColor
      @second.on_tap {
        select SECOND
      }
      self << @second

      @second_label = RLabel.bold_label_at [[@long_width, 0], [@short_width, r_height(self.frame)]], self.second_long_text, 28, true
      @second_label.contentMode = UIViewContentModeCenter
      self << @second_label
    end

    self
  end

  def select(index)
    @selected_index = index
    send_action = lambda { sendActionsForControlEvents UIControlEventValueChanged }

    case index
      when FIRST
        grow_first_label
        shorten_second_label
        shorten_third_label

        @second.change_frame [[@long_width, 0], [@short_width - ANIMATION_OFFSET/2, r_height(self.frame)+VISUAL_OFFSET]], lambda {
          @second.change_frame [[@long_width - ANIMATION_OFFSET, 0], [@short_width, r_height(self.frame)+VISUAL_OFFSET]], send_action, OFFSET_DURATION
        }, OFFSET_DURATION
      when SECOND
        shorten_first_label
        grow_second_label
        shorten_third_label

        @second.change_frame [[@short_width, 0], [@long_width, r_height(self.frame)+VISUAL_OFFSET]], lambda {
          @second.change_frame [[@short_width + ANIMATION_OFFSET, 0], [@long_width - 2*ANIMATION_OFFSET, r_height(self.frame)+VISUAL_OFFSET]], send_action, OFFSET_DURATION
        }, OFFSET_DURATION
      when THIRD
        shorten_first_label
        shorten_second_label
        grow_third_label

        @second.change_frame [[@short_width + ANIMATION_OFFSET/2, 0], [@short_width - ANIMATION_OFFSET/2, r_height(self.frame)+VISUAL_OFFSET]], lambda {
          @second.change_frame [[@short_width + ANIMATION_OFFSET + ANIMATION_OFFSET/2, 0], [@short_width, r_height(self.frame)+VISUAL_OFFSET]], send_action, OFFSET_DURATION
        }, OFFSET_DURATION
      else
        # do nothing
    end

  end

  def grow_first_label
    @first_label.change_frame [[0, 0], [@long_width, r_height(self.frame)]], lambda {
      change_text @first_label, self.first_long_text
    }
  end

  def shorten_first_label
    @first_label.text = self.first_short_text
    @first_label.change_frame [[0, 0], [@short_width, r_height(self.frame)]]
  end

  def grow_second_label
    @second_label.change_frame [[@short_width, 0], [@long_width, r_height(self.frame)]], lambda {
      change_text @second_label, self.second_long_text
    }
  end

  def shorten_second_label
    @second_label.text = self.second_short_text
    case @selected_index
      when FIRST
        @second_label.change_frame [[@long_width, 0], [@short_width, r_height(self.frame)]]
      when THIRD
        @second_label.change_frame [[@short_width, 0], [@short_width, r_height(self.frame)]]
      else
        # do nothing
    end
  end

  def grow_third_label
    @third_label.change_frame [[@long_width, 0], [@long_width, r_height(self.frame)]], lambda {
      change_text @third_label, self.third_long_text
    }
  end

  def shorten_third_label
    @third_label.text = self.third_short_text
    @third_label.change_frame [[@long_width + @short_width, 0], [@short_width, r_height(self.frame)]]
  end

  def change_text(label, text)
    animation = CATransition.animation
    animation.duration = 0.25
    animation.type = KCATransitionFade
    animation.timingFunction = CAMediaTimingFunction.functionWithName KCAMediaTimingFunctionEaseInEaseOut
    label.layer.addAnimation animation, forKey:'changeTextTransition'

    label.text = text
  end

  def show_initial
    if @selected_index == 0
      change_text @first_label, self.first_long_text
      change_text @second_label, self.second_short_text
      change_text @third_label, self.third_short_text
    else
      select 0
    end
  end

end