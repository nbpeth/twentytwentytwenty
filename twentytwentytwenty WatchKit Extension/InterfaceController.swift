import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var timerState:Bool?
    @IBOutlet var alertButton: WKInterfaceButton!
    
    @IBAction func alertButtonWasPressed() {
        timerState = WatchMessageDelegate.sharedInstance.onMessage("changeState")
        print(WatchMessageDelegate.sharedInstance.onMessage("getTimerState"))
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        WatchMessageDelegate.sharedInstance.activateSession()

    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

}
