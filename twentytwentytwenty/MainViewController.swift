
import UIKit

class MainViewController: UIViewController, TimeMachineLabelDelegate {
    let timeMachine = TimeMachine.sharedInstance
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func startWasPressed(sender: AnyObject) {
        if timeMachine.isActive() == true {
            return
        }
        timeMachine.activate()
    }
    
    @IBAction func stopWasPressed(sender: AnyObject) {
        timeMachine.killTimers()
        resetProgressBar()
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        resetProgressBar()
        timeMachine.labelDelegate = self
    }
    
    func resetProgressBar(){
        progressView.setProgress(0, animated: false)
        displayLabel.text = "*"
    }
    
    func updateLabel(time:String){
        displayLabel.text = time
    }
    
    func updateProgressBar(value:Float, duration:Float){
        let progress = value < 1 ? 0.0 : (value / duration)
        progressView.setProgress(progress, animated: true)
    }
    

}
