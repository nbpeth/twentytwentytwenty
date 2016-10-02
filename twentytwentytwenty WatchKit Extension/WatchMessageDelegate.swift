import WatchConnectivity
import Foundation

class WatchMessageDelegate: NSObject, WCSessionDelegate {
    static let sharedInstance = WatchMessageDelegate()
    private override init() {}
    
    var session:WCSession?
    
    func activateSession(){
        session = WCSession.defaultSession()
        session?.delegate = self
        session?.activateSession()
        
        print("activating session  \(session?.reachable)   ")
        
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
            replyHandler(["reply":"gotMessage"])
            print("got message in the watch!")
            print(message)
        
    }
    
    func onMessage(message:String) -> Bool{
        var timerResponse:Bool = false
        if session?.reachable == true {
            session?.sendMessage([message:""],
                                 replyHandler: { response in
                                    timerResponse = (response["timerResponse"] as? Bool)!
                                    print(response)},
                                 errorHandler: { error in print(error) })
        }
        else{
            print("phone is unreachable")
        }
        return timerResponse
    }
    
    func sendTimerMessage(requestMessage:String) -> Bool{
        return onMessage(requestMessage)
    }

    
}
