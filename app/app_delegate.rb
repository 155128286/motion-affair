class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.makeKeyAndVisible

    map_router_urls
    @router.open 'p0'

    true
  end

  def map_router_urls
    @router = Routable::Router.router
    @router.navigation_controller = UINavigationController.new

      @router.map 'p0', P0ViewController
      @router.map 'p1', P1ViewController
      @router.map 'p2', P2ViewController

    @window.rootViewController = @router.navigation_controller
  end

  def open(url)
    @router.open url
  end

  def pop
    @router.pop
  end

end
