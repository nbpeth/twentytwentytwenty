import Foundation
import WatchConnectivity
import NotificationCenter

class WatchMessageDelegate: NSObject, WCSessionDelegate {
    var session:WCSession?
    static let sharedInstance = WatchMessageDelegate()
    var delegate:TimeMachineLabelDelegate?
    fileprivate override init() {}
    
    func startSession(){
        session = WCSession.default()
        session?.delegate = self
        session?.activate()
    }
    
    func onMessage(_ alert:String){
        if session?.isReachable == true {
            session?.sendMessage(["timerChangingState":alert],
                replyHandler: { response in print(response)},
                errorHandler: { error in print(error) })
        }
        else{
            print("watch is unreachable")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if message["changeState"] != nil{
            let timemachine = TimeMachine.sharedInstance
    
            if timemachine.isActive() == true {
                DispatchQueue.main.async(execute: { () -> Void in
                    timemachine.killTimers()
                    self.delegate?.updateUI()
                    
                })
            }
            else{
                DispatchQueue.main.async(execute: { () -> Void in
                    timemachine.activate()
                    self.delegate?.updateUI()
                })
                
            }
            
            replyHandler(["timerResponse":timemachine.isActive()])
        }
        
        if message["getTimerState"] != nil{
            replyHandler(["timerResponse":TimeMachine.sharedInstance.isActive()])
        }
    }
    
    func sessionDidDeactivate(_ session: WCSession) {}
    
    func sessionDidBecomeInactive(_ session: WCSession) {}
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    
    

}
