import Foundation
import NotificationCenter

class NotificationService {
    
    func notifyRest(){
        
        let localNote = UILocalNotification()
        localNote.alertBody = "Rest your eyes"
        localNote.alertAction = "action"
        localNote.alertTitle = "hey bud"
        localNote.category = "myCategory"
        localNote.fireDate = NSDate().dateByAddingTimeInterval(1)
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNote)
    }
    
    func notifyTimerStart(){
        WatchMessageDelegate.sharedInstance.onMessage("off")
    }
    
    func notifyTimerEnd(){
        WatchMessageDelegate.sharedInstance.onMessage("on")

    }
    
}