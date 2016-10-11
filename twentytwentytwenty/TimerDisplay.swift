import Foundation

class TimerDisplay {
    
    static func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    static func formatTime(minutes:Int, seconds:Int) -> (String, String) {
        return(
            minutes < 10 ? String(format: "%02d", minutes) : String(minutes),
            seconds < 10 ? String(format: "%02d", seconds) : String(seconds)
        )
    }
    
    static func setTimerDisplay(seconds:Int) -> String{
        let (m,s) = secondsToHoursMinutesSeconds(seconds: seconds)
        let (x,y) = formatTime(minutes: m, seconds: s)
        
        return "\(x):\(y)"
    }
    
    
    
}
