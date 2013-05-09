class RSegmentedControl <UIControl

  attr_accessor :selected_index

  VISUAL_OFFSET = 1
  ANIMATION_OFFSET = 40
  OFFSET_DURATION = 0.2

  FIRST = 0
  SECOND = 1
  THIRD = 3

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

      @third = UIView.alloc.initWithFrame [[@long_width, 0], [@long_width, r_height(self.frame)]]
      @third.backgroundColor = UIColor.orangeColor
      @third.on_tap {
        select THIRD
      }
      self << @third

      @second = UIView.alloc.initWithFrame [[@long_width - ANIMATION_OFFSET, 0], [@short_width, r_height(self.frame)+VISUAL_OFFSET]]
      @second.backgroundColor = UIColor.brickRedColor
      @second.on_tap {
        select SECOND
      }
      self << @second

    end

    self
  end

  def select(index)
    @selected_index = index
    send_action = lambda { sendActionsForControlEvents UIControlEventValueChanged }

    case index
      when FIRST
        @second.change_frame [[@long_width, 0], [@short_width - ANIMATION_OFFSET/2, r_height(self.frame)+VISUAL_OFFSET]], lambda {
          @second.change_frame [[@long_width - ANIMATION_OFFSET, 0], [@short_width, r_height(self.frame)+VISUAL_OFFSET]], send_action, OFFSET_DURATION
        }, OFFSET_DURATION
      when SECOND
        @second.change_frame [[@short_width, 0], [@long_width, r_height(self.frame)+VISUAL_OFFSET]], lambda {
          @second.change_frame [[@short_width + ANIMATION_OFFSET, 0], [@long_width - 2*ANIMATION_OFFSET, r_height(self.frame)+VISUAL_OFFSET]], send_action, OFFSET_DURATION
        }, OFFSET_DURATION
      when THIRD
        @second.change_frame [[@short_width + ANIMATION_OFFSET/2, 0], [@short_width - ANIMATION_OFFSET/2, r_height(self.frame)+VISUAL_OFFSET]], lambda {
          @second.change_frame [[@short_width + ANIMATION_OFFSET + ANIMATION_OFFSET/2, 0], [@short_width, r_height(self.frame)+VISUAL_OFFSET]], send_action, OFFSET_DURATION
        }, OFFSET_DURATION
      else
        # do nothing
    end

  end

end