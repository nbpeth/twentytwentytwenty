import Foundation
import NotificationCenter

class NotificationService {
    
    func notifyRest(){
        
        let localNote = UILocalNotification()
        localNote.alertBody = "Look at anything 20 yards away for 20 seconds"
        localNote.alertAction = "action"
        localNote.alertTitle = "Rest Your Eyes"
        localNote.category = "myCategory"
        localNote.fireDate = Date().addingTimeInterval(1)
        
        UIApplication.shared.scheduleLocalNotification(localNote)
    }
    
    func notifyTimerStart(){
        WatchMessageDelegate.sharedInstance.onMessage("on")
    }
    
    func notifyTimerEnd(){
        WatchMessageDelegate.sharedInstance.onMessage("off")

    }
    
}
