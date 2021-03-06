import Foundation

class StartButtonCommand : NSObject, ButtonCommand {
    let button:StartButton?
    
    init(button:StartButton){
        self.button = button
    }
    
    func execute() {
        if let startButton = button {
            startButton.start()
        }
    }
}
