import Foundation

class NotificationService {
    
    func notifyRest(){
        WatchMessageDelegate.sharedInstance.onMessage("rest")
        
        
    }
    
    func notifyWake(){
        WatchMessageDelegate.sharedInstance.onMessage("wake up")
    }
    
    
}