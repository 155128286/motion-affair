class RSegmentedControl <UIControl

  attr_accessor :selected_index

  def initWithFrame(frame)
    if super frame
      @long_width = r_width(frame)/2
      @short_width = @long_width/2

      @selected_index = 0

      @first = UIView.alloc.initWithFrame [[0, 0], [@long_width, r_height(self.frame)]]
      @first.backgroundColor = UIColor.infoBlueColor
      @first.on_tap {
        select 0
      }
      self << @first

      @second = UIView.alloc.initWithFrame [[@long_width, 0], [@short_width, r_height(self.frame)]]
      @second.backgroundColor = UIColor.brickRedColor
      @second.on_tap {
        select 1
      }
      self << @second

      @third = UIView.alloc.initWithFrame [[@long_width + @short_width, 0], [@short_width, r_height(self.frame)]]
      @third.backgroundColor = UIColor.orangeColor
      @third.on_tap {
        select 2
      }
      self << @third
    end

    self
  end

  def select(index)
    @selected_index = index

    case index
      when 0
        @first.frame = [[0, 0], [@long_width, r_height(self.frame)]]
        @second.frame = [[@long_width, 0], [@short_width, r_height(self.frame)]]
        @third.frame = [[@long_width + @short_width, 0], [@short_width, r_height(self.frame)]]
      when 1
        @first.frame = [[0, 0], [@short_width, r_height(self.frame)]]
        @second.frame = [[@short_width, 0], [@long_width, r_height(self.frame)]]
        @third.frame = [[@long_width + @short_width, 0], [@short_width, r_height(self.frame)]]
      when 2
        @first.frame = [[0, 0], [@short_width, r_height(self.frame)]]
        @second.frame = [[@short_width, 0], [@short_width, r_height(self.frame)]]
        @third.frame = [[@short_width + @short_width, 0], [@long_width, r_height(self.frame)]]
      else
        # do nothing
    end

    sendActionsForControlEvents UIControlEventValueChanged
  end

end