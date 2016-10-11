
import Foundation
import UIKit

@IBDesignable
class StartButton: UIControl {
    let timeMachine = TimeMachine.sharedInstance
    var isOn:Bool?
    
    func start(){
        if timeMachine.isActive() == true {
            return
        }
        timeMachine.activate()
        self.isOn = true
        self.backgroundColor = UIColor(red:191/255,green:49/255,blue:55/255, alpha:0.80)

    }
    
    func stop(){
        timeMachine.killTimers()
        self.isOn = false
        self.backgroundColor = UIColor(red:105/255,green:0/255,blue:255/255, alpha:0.80)

    }
    
    func updateUI(){
        if timeMachine.isActive() == true {
            self.isOn = true
            self.backgroundColor = UIColor(red:191/255,green:49/255,blue:55/255, alpha:0.80)
        }
        else{
            self.isOn = false
            self.backgroundColor = UIColor(red:105/255,green:0/255,blue:255/255, alpha:0.80)
        }
    }

}
