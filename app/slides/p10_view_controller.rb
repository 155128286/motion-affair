class P10ViewController <RViewController

  # 1. Obj-C repos -> Cocoapods -> motion-cocoapods -> Rubymotion
  # 2. Runtime Crash (AddressBook, CoreLocation, UITextField)
  # 3. Clang vs Rubymotion - ARCLite (PSTCollectionView)

  def swipe_left
    app_delegate.open 'end'
  end

end