import Foundation
import WatchConnectivity

class WatchMessageDelegate: NSObject, WCSessionDelegate {
    var session:WCSession?
    static let sharedInstance = WatchMessageDelegate()
    private override init() {}
    
    func startSession(){
        session = WCSession.defaultSession()
        session?.delegate = self
        session?.activateSession()
    }
    
    func onMessage(alert:String){
        if session?.reachable == true {
            session?.sendMessage(["alert":alert],
                replyHandler: { response in print(response)},
                errorHandler: { error in print(error) })
        }
        else{
            print("watch is unreachable")
        }
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        if message["changeState"] != nil{
            let timemachine = TimeMachine.sharedInstance
            if timemachine.isActive() == true {
                timemachine.killTimers()
            }
            else{
                timemachine.activate()
            }
            
            replyHandler(["timerResponse":timemachine.isActive()])
        }
        
        if message["getTimerState"] != nil{
            replyHandler(["timerResponse":TimeMachine.sharedInstance.isActive()])
        }
    }
    

}