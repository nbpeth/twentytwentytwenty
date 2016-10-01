import Foundation
import UIKit

class Timer {
    var timer = NSTimer()
    var duration:Int
    
    init(duration:Int, target:AnyObject, selector:Selector){
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: target, selector: selector, userInfo: nil, repeats: true)
        self.duration = duration
    }
    
    func stop(){
        timer.invalidate()
    }
    
    func update(){
        if(duration >= 0){
            duration -= 1
            
        }
        else{
            stop()
        }
    }
    
    func isActive() -> Bool {
        return self.timer.valid
    }
    
    
}
