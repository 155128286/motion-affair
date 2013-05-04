class P2ViewController <RViewController

  def loadView
    super

    SVProgressHUD.showWithStatus 'Loading Big Ass Image'
    @image_scroll_view = RImageScrollView.image_scroll_view_at [[0, 0], [1024, 768]]
    @image_scroll_view.next = lambda { swipe_left }
    @image_scroll_view.previous = lambda { swipe_right }

    Dispatch::Queue.concurrent.async do
      @image_scroll_view.image = 'horizen_Mosaic_edit.png'.uiimage
      Dispatch::Queue.main.sync do
        self.view << @image_scroll_view
        SVProgressHUD.dismiss
      end
    end
  end

  def swipe_left
    app_delegate.open 'p3'
  end

end