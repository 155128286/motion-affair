class P3ViewController <UIViewController
  def loadView
    super
  end

  def viewWillAppear(animated)
    super
    SVProgressHUD.showWithStatus 'Loading Big Ass Image'
  end

  def viewDidAppear(animated)
    super

    Dispatch::Queue.concurrent.async do
      image_scroll_view = RImageScrollView.image_scroll_view_at self.view.bounds, 'horizen_Mosaic_edit.png'.uiimage
      Dispatch::Queue.main.sync do
        self.view << image_scroll_view
        SVProgressHUD.dismiss
      end
    end
  end

end