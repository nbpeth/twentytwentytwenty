
import UIKit
protocol LabelDelegate:class{
    func updateLabel(time:String);
    func updateProgressBar(value:Float, duration:Float);
    func resetProgressBar();
}

class MainViewController: UIViewController, LabelDelegate {
    let timeMachine = TimeMachine.sharedInstance
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func startWasPressed(sender: AnyObject) {
        timeMachine.createSessionTimer()
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
    }
    
    func updateLabel(time:String){
        displayLabel.text = time
    }
    
    func updateProgressBar(value:Float, duration:Float){
        let progress = value < 1 ? 0.0 : (value / duration)
        progressView.setProgress(progress, animated: true)
    }
    

}
