import WatchKit
import Foundation

protocol InterfaceDelegate: class{
    func setState(_ state:String)
}

class InterfaceController: WKInterfaceController, InterfaceDelegate {
    let states = ["on":"Stop","off":"Start"]
    let stateColor = ["on":UIColor.red, "off":UIColor.blue]
    var currentState:Bool = false
    
    @IBOutlet var changeStateButton: WKInterfaceButton!
    
    @IBAction func changeStateButtonWasPressed() {
        WatchMessageDelegate.sharedInstance.onMessage("changeState", changeState: true)
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        WatchMessageDelegate.sharedInstance.activateSession()
        WatchMessageDelegate.sharedInstance.interfaceDelegate = self
        WatchMessageDelegate.sharedInstance.onMessage("getTimerState")
        
    }
    
    func setState(_ state:String){
        updateButton(state)
    }
    
    func updateButton(_ state:String){
        changeStateButton.setTitle(states[state])
        changeStateButton.setBackgroundColor(stateColor[state])

    }

}
