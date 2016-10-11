import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var session: WCSession?
    var watchMessageDelegate: WatchMessageDelegate?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        WatchMessageDelegate.sharedInstance.startSession()
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [UIUserNotificationType.alert , UIUserNotificationType.badge ], categories: nil))
        application.beginBackgroundTask(withName: "showNotification", expirationHandler: nil)

        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

