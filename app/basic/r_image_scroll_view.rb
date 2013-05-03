class RImageScrollView <RFullScreenView

  def self.image_scroll_view_at(frame, image=nil)
    container = RImageScrollView.alloc.initWithFrame frame
    container.image = image unless image.nil?
    container
  end

  attr_accessor :image

  def initWithFrame(frame)
    if super frame
      @image_scroll = UIScrollView.alloc.initWithFrame self.bounds
      @image_scroll.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
      @image_scroll.delegate = self
      @image_scroll.showsHorizontalScrollIndicator = false
      @image_scroll.showsVerticalScrollIndicator = false
      self << @image_scroll

      @image_view = UIImageView.alloc.initWithFrame CGRectZero
      @image_view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
      @image_scroll << @image_view

      double_tap = UITapGestureRecognizer.alloc.initWithTarget self, action:'double_tapped:'
      double_tap.numberOfTapsRequired = 2
      self.addGestureRecognizer double_tap

      single_tap = UITapGestureRecognizer.alloc.initWithTarget self, action:'single_tapped:'
      single_tap.requireGestureRecognizerToFail double_tap
      self.addGestureRecognizer single_tap
    end

    self
  end

  def image=(new_image)
    @image = new_image
    render_pinch_image
  end

  def render_pinch_image
    @image_view.image = @image
    @image_view.frame = [[0, 0], @image.size]
    @image_scroll.contentSize = @image.size

    view_width = @image_scroll.bounds.size.width
    image_width = @image.size.width
    width_factor = view_width/image_width

    view_height = @image_scroll.bounds.size.height
    image_height = @image.size.height
    height_factor = view_height/image_height

    max_scale = 1.0
    min_scale = [width_factor, height_factor].min

    @image_scroll.setMaximumZoomScale max_scale
    @image_scroll.setMinimumZoomScale min_scale
    @image_scroll.setZoomScale min_scale

    center_scroll_if_needed
  end

  def center_scroll_if_needed
    if @image_scroll.contentSize.height < @image_scroll.bounds.size.height
      content_offset = @image_scroll.contentOffset
      content_offset.y = - (@image_scroll.bounds.size.height - @image_scroll.contentSize.height) / 2.0
      @image_scroll.contentOffset = content_offset
    end

    if @image_scroll.contentSize.width < @image_scroll.bounds.size.width
      content_offset = @image_scroll.contentOffset
      content_offset.x = - (@image_scroll.bounds.size.width - @image_scroll.contentSize.width) / 2.0
      @image_scroll.contentOffset = content_offset
    end
  end

  def zoom_rect_for(center)
    zoom_rect = CGRectZero
    zoom_rect.size.width = self.bounds.size.width / @image_scroll.maximumZoomScale
    zoom_rect.size.height = self.bounds.size.height / @image_scroll.maximumZoomScale
    zoom_rect.origin.x = center.x - (zoom_rect.size.width / 2.0)
    zoom_rect.origin.y = center.y - (zoom_rect.size.height / 2.0)
    zoom_rect
  end

  def double_tapped(sender)
    if @image_scroll.zoomScale < @image_scroll.maximumZoomScale
      tap_location = sender.locationInView @image_view
      tap_rect = zoom_rect_for tap_location
      @image_scroll.zoomToRect(tap_rect, animated:true)
    else
      @image_scroll.setZoomScale(@image_scroll.minimumZoomScale, animated:true)
    end
  end

  def single_tapped(sender)
    if self.next && @image_scroll.zoomScale == @image_scroll.minimumZoomScale
      self.next.call()
    end
  end

  def viewForZoomingInScrollView(scrollView)
    @image_view
  end

  def scrollViewWillBeginZooming(scrollView, withView:view)
    center_scroll_if_needed
  end

  def scrollViewDidZoom(scrollView)
    center_scroll_if_needed
  end

  def scrollViewDidEndZooming(scrollView, withView:view, atScale:scale)
    center_scroll_if_needed
  end

  def scrollViewWillBeginDragging(scrollView)
    center_scroll_if_needed
  end

  def scrollViewDidScroll(scrollView)
    center_scroll_if_needed
  end

end