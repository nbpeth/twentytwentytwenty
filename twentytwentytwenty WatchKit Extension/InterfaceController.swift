import WatchKit
import Foundation

protocol InterfaceDelegate: class{
    func changeState(state:String)
}

class InterfaceController: WKInterfaceController, InterfaceDelegate {
    let states = ["on":"Start","off":"Stop"]
    var state:Bool = false
    var messageDelegate:WatchMessageDelegate? = nil
    
    @IBOutlet var changeStateButton: WKInterfaceButton!
    
    @IBAction func changeStateButtonWasPressed() {
        messageDelegate?.onMessage("changeState")
        
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        messageDelegate = WatchMessageDelegate(delegate: self)
        messageDelegate?.activateSession()

    }
    
    func changeState(state:String){
        changeStateButton.setTitle(states[state])
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

}
