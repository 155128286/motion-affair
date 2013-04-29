class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.makeKeyAndVisible

    map_router_urls
    @router.open 'Intro'

    true
  end

  def map_router_urls
    @router = Routable::Router.router
    @router.navigation_controller = UINavigationController.new

      # Router Mapping
      @router.map 'Intro', IntroViewController

    @window.rootViewController = @router.navigation_controller
  end

end
