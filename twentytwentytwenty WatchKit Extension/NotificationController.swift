import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {
    @IBOutlet var alertTypeLabel: WKInterfaceLabel!

    override init() {
        super.init()
        
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    override func didReceive(_ localNotification: UILocalNotification, withCompletion completionHandler: (@escaping (WKUserNotificationInterfaceType) -> Void)) {
        alertTypeLabel.setText(localNotification.alertBody)
        WKInterfaceDevice.current().play(.notification)
        completionHandler(.custom)
    }
 
    
    
    override func didReceiveRemoteNotification(_ remoteNotification: [AnyHashable: Any], withCompletion completionHandler: (@escaping (WKUserNotificationInterfaceType) -> Void)) {
 
        completionHandler(.custom)
    }
}
