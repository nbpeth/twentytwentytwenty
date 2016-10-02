import Foundation

class TimeMachineMonitor {
    private var active:Bool = false
    var sharedInstance = TimeMachineMonitor()
    
    private init(){}
    
    func isActive() -> Bool{
        return self.active
    }
    
    func activate(){
        self.active = true
    }
    
    func deactivate(){
        self.active = false
    }
    
}
