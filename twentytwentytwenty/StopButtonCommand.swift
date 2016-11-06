
import Foundation

class StopButtonCommand:ButtonCommand {
    var button:StartButton?
    
    init(button:StartButton){
        self.button = button
    }
    
    func execute() {
        if let startButton = button {
            startButton.stop()
        }
    }
    
}
