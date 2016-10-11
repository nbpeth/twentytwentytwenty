
import Foundation
import UIKit

class TimeMachine {
    var restTimer:Timer?
    var sessionTimer:Timer?
    var eyeRestDuration:Int = 2
    var sessionDuration:Int = 10
    var labelDelegate:TimeMachineLabelDelegate?
    var active:Bool = false
    
    static let sharedInstance = TimeMachine()
    fileprivate init() {}
    
    func activate(){
        NotificationService().notifyTimerStart()
        setActivity(true)
        createSessionTimer()
    }
    
    func createSessionTimer(){
        labelDelegate?.updateUI()
        sessionTimer = Timer(duration: sessionDuration, target: self, selector:#selector(updateSessionTimer))
        sessionTimer?.timer.fire()
    }
    
    func createRestTimer(){
        labelDelegate?.updateUI()
        restTimer = Timer(duration: eyeRestDuration, target: self, selector:#selector(updateRestTimer))
        
    }
    
    @objc func updateSessionTimer(){
        if let timer = sessionTimer {
            let duration = timer.duration

            if(duration <= 0) {
                flipTimers(true)
            }
            else{
                labelDelegate?.updateLabel(timer.duration)
                labelDelegate?.updateProgressBar(Float(duration), duration: Float(sessionDuration))

                timer.update()
            }
        }
    }
    
    @objc func updateRestTimer(){
        if let timer = restTimer {
            let duration = timer.duration
            
            if(duration <= 0) {
                flipTimers(false)
            }
            else{
                labelDelegate?.updateLabel(timer.duration)
                labelDelegate?.updateProgressBar(Float(duration), duration: Float(eyeRestDuration))
                timer.update()
            }
        }
    }
    
    func flipTimers(_ resting:Bool){
        if resting == true{
            rest()
            
        }
        else{
            wake()
        }
    }
    
    func rest(){
        if let stimer = sessionTimer {
            stimer.stop()
        }
        
        NotificationService().notifyRest()
        createRestTimer()
        
    }
    
    func wake(){
        if let rtimer = restTimer {
            rtimer.stop()
        }
        
        createSessionTimer()
        
    }
    
    func updateLabels(_ timer:Timer){
        labelDelegate?.updateLabel(timer.duration)
        
    }
    
    func killTimers(){
        NotificationService().notifyTimerEnd()
        setActivity(false)
        restTimer?.stop()
        sessionTimer?.stop()
        labelDelegate?.updateUI()

    }
    
    func isActive () -> Bool {
        return active
    }
    
    func setActivity(_ active:Bool){
        self.active = active
    }

}
