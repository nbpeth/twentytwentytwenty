import Foundation

class StartButtonCommand : NSObject, ButtonCommand {
    let button:StartButton?
    
    init(button:StartButton){
        self.button = button
    }
    
    func pressButton() {
        if let startButton = button {
            startButton.start()
        }
    }
}
