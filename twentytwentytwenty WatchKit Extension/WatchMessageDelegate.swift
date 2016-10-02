import WatchConnectivity
import Foundation

class WatchMessageDelegate: NSObject, WCSessionDelegate {
    var interfaceDelegate: InterfaceDelegate? = nil
    var session:WCSession?
    
    init(delegate:InterfaceDelegate){
        self.interfaceDelegate = delegate
    }
    
    func activateSession(){
        session = WCSession.defaultSession()
        session?.delegate = self
        session?.activateSession()
        
        print("activating session  \(session?.reachable)   ")
        
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        if let alert = message["alert"] as? String{
            if alert == "on"{
                self.interfaceDelegate?.changeState(alert)
            }
            else if alert == "off"{
                self.interfaceDelegate?.changeState(alert)

            }
            
        }
    }
    
    func onMessage(message:String){
        if session?.reachable == true {
            session?.sendMessage([message:""],
                replyHandler: { response in
                    if let stateResponse = response["changeState"] as? String {
                        let state = stateResponse == "0" ? "on" : "off"
                        self.interfaceDelegate?.changeState(state)
                }
                    
                print(response)},
                errorHandler: { error in print(error) })
        }
        else{
            print("phone is unreachable")
        }
    }
    
    func sendTimerMessage(requestMessage:String){
        return onMessage(requestMessage)
    }

    
}
