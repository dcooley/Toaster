import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var orientationLock = UIInterfaceOrientationMask.all
  // https://stackoverflow.com/a/41811798/5977215
  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
      return self.orientationLock
  }
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.backgroundColor = UIColor.white
    window.rootViewController = UINavigationController(rootViewController: RootViewController())
    window.makeKeyAndVisible()
    return true
  }
}

struct AppUtility {
    
  static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
      
    print("AppUtility.lockOrientation()")
      if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
      }
  }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
  static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
    print("AppUtility.lockOrientation(andRotateTo)")
    self.lockOrientation(orientation)

    UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    UINavigationController.attemptRotationToDeviceOrientation()
  }
}
