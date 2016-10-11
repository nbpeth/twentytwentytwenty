import WatchConnectivity
import Foundation

class WatchMessageDelegate: NSObject, WCSessionDelegate {
    static let sharedInstance = WatchMessageDelegate()
    var interfaceDelegate: InterfaceDelegate? = nil
    var session:WCSession?
    fileprivate override init() {}
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

        onMessage("getTimerState")        
    }

    func activateSession(){
        session = WCSession.default()
        session?.delegate = self
        session?.activate()
        
        print("activating session  \(session?.isReachable)   ")
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let alert = message["timerChangingState"] as? String{

            self.interfaceDelegate?.setState(alert)

        }
    }
    
    func onMessage(_ message:String, changeState:Bool = false){
        if session?.isReachable == true {
            session?.sendMessage([message:""],
                replyHandler: { response in
                    if let stateResponse = response["timerResponse"] as? Int {
                        let state = stateResponse == 0 ? "off" : "on"
                        
                        self.interfaceDelegate?.setState(state)

                }
                    
                print(response)},
                errorHandler: { error in print(error) })
        }
        else{
            print("phone is unreachable")
        }
    }
    
    func sendTimerMessage(_ requestMessage:String){
        return onMessage(requestMessage)
    }

    
}
