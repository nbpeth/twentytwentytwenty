import Foundation
import NotificationCenter

class NotificationService {
    
    func notifyRest(){
        
        let localNote = UILocalNotification()
        localNote.alertBody = "Rest your eyes"
        localNote.alertAction = "action"
        localNote.alertTitle = "hey bud"
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
