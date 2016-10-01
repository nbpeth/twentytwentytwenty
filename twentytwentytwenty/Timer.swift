import Foundation
import UIKit

class Timer {
    var timer = NSTimer()
    var duration:Int
    var progressBar:UIView?
    
    init(duration:Int, progressBar:UIView, target:AnyObject, selector:Selector){
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: target, selector: selector, userInfo: nil, repeats: true)
        self.progressBar = progressBar
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
