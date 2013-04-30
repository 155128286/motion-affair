class P3ViewController <UIViewController

  def loadView
    super

    image_scroll_view = RImageScrollView.image_scroll_view_at self.view.bounds, 'horizen_Mosaic_edit.png'.uiimage
    self.view << image_scroll_view
  end

end