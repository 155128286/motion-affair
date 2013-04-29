class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible

    label = UILabel.alloc.initWithFrame @window.bounds
    label.font = UIFont.systemFontOfSize 32
    label.text = 'Hello World'
    @window.addSubview label

    true
  end

end
