
import Foundation
import UIKit

class TimeMachine {
    var restTimer:Timer?
    var sessionTimer:Timer?
    var eyeRestDuration:Int = 1
    var sessionDuration:Int = 2
    var labelDelegate:LabelDelegate?
    
    static let sharedInstance = TimeMachine()
    private init() {}
    
    @objc func updateSessionTimer(){
        
        if let timer = sessionTimer {
            let duration = timer.duration

            if(duration <= 0) {
                flipTimers(true)
            }
            else{
                labelDelegate?.updateLabel(String(timer.duration))
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
                labelDelegate?.updateLabel(String(timer.duration))
                labelDelegate?.updateProgressBar(Float(duration), duration: Float(eyeRestDuration))
                timer.update()
            }
        }
    }
    
    func flipTimers(resting:Bool){
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
        
        NotificationService().notifyWake()
        createSessionTimer()
        
    }
    
    func createSessionTimer(){
        labelDelegate?.resetProgressBar()
        sessionTimer = Timer(duration: sessionDuration, target: self, selector:#selector(updateSessionTimer))
        
    }

    func createRestTimer(){
        labelDelegate?.resetProgressBar()
        restTimer = Timer(duration: eyeRestDuration, target: self, selector:#selector(updateRestTimer))
        
    }
    
    func updateLabels(timer:Timer){
        labelDelegate?.updateLabel(String(timer.duration))
        
    }
    
    func killTimers(){
        restTimer?.stop()
        sessionTimer?.stop()
    }

}