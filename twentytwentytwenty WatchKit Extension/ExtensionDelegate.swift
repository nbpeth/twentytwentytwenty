import WatchKit

class ExtensionDelegate: NSObject {
    
    func applicationDidFinishLaunching() {
        WatchMessageDelegate.sharedInstance.activateSession()
    }

    func applicationDidBecomeActive() {

    }

    func applicationWillResignActive() {

    }

}
