
import UIKit

class MainViewController: UIViewController, TimeMachineLabelDelegate {
    let timeMachine = TimeMachine.sharedInstance
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var startButtonControl: StartButton!
    @IBOutlet weak var circleProgressView: CircleProgressView!
    
    @IBAction func startButtonWasPressed(_ sender: AnyObject) {
        pressButton()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setDelegate()

    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func updateUI(){
        circleProgressView?.moveit(value: 1)
        displayLabel.text = ""
        UpdateButtonCommand(button: startButtonControl).execute()
    }
    
    func setDelegate(){
        timeMachine.labelDelegate = self
    }
    
    func updateLabel(_ time:Int){
        displayLabel.text = TimerDisplay.setTimerDisplay(seconds: time)
    }
    
    func updateProgressBar(_ value:Float, duration:Float){
        let progress = value < 1 ? 0.0 : (value / duration)
        circleProgressView?.moveit(value: progress)
    }
    
    func pressButton(){
        var command:ButtonCommand?
        if(startButtonControl?.isOn != true){
            command = StartButtonCommand(button:startButtonControl)
        }
        else{
            command = StopButtonCommand(button:startButtonControl)
        }
        
        command?.execute()
    }
    
    
}
