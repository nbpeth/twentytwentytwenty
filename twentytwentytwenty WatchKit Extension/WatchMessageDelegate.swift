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
        
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        print("got message!")
        print(message)
        
    }
    
}
