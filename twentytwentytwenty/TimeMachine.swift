
import Foundation

class TimeMachine {
    var restTimer:Timer?
    var sessionTimer:Timer?
    var eyeRestDuration:Int = 10
    var sessionDuration:Int = 20
    
    static let sharedInstance = TimeMachine()
    
    
}