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
    }
    
    
    
}