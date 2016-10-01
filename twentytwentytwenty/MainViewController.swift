
import UIKit

class MainViewController: UIViewController {
    var restTimer:Timer?
    var sessionTimer:Timer?
    var eyeRestDuration:Int = 10
    var sessionDuration:Int = 20
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func startWasPressed(sender: AnyObject) {
        createSessionTimer()
    }
    
    func updateSessionTimer(){
        
        if let timer = sessionTimer {
            let duration = timer.duration
            if(duration < 0) {
                flipTimers(true)
            }
            else{
                timer.update()
                displayLabel.text = String(duration)
                updateProgressBar(Float(duration), duration: Float(sessionDuration))
            }
        }
    }
    
    func updateRestTimer(){
        if let timer = restTimer {
            let duration = timer.duration
            if(duration < 0) {
                flipTimers(false)
            }
            else{
                restTimer?.update()
                displayLabel.text = String(duration)
                updateProgressBar(Float(duration), duration: Float(eyeRestDuration))
            }
        }
    }
    
    @IBAction func stopWasPressed(sender: AnyObject) {
        restTimer?.stop()
        sessionTimer?.stop()
        
    }
    
    func createSessionTimer(){
        progressView.setProgress(0, animated: false)
        sessionTimer = Timer(duration: sessionDuration, progressBar:progressView, target: self, selector: #selector(MainViewController.updateSessionTimer))
 
    }
    
    func createRestTimer(){
        progressView.setProgress(0, animated: false)
        restTimer = Timer(duration: eyeRestDuration, progressBar: progressView, target: self, selector: #selector(MainViewController.updateRestTimer))

    }
    
    func flipTimers(resting:Bool){
        if resting == true{
            if let stimer = sessionTimer {
                stimer.stop()
                }

            createRestTimer()
            
        }
        else{
            if let rtimer = restTimer {
                rtimer.stop()
            }
            
            createSessionTimer()
        }
    }
    
    func updateProgressBar(value:Float, duration:Float){
        let progress = value < 1 ? 0.0 : (value / duration)

        progressView.setProgress(progress, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgress(0.0, animated: true)
        
    }
    
}
