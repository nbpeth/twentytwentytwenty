
import Foundation

class UpdateButtonCommand : ButtonCommand {
    var button:StartButton?
    
    init(button:StartButton){
        self.button = button
    }
    
    func execute(){
        if let startButton = button {
            startButton.updateUI()
        }
    }
}
