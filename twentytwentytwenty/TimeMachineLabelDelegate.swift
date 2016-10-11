
import Foundation

protocol TimeMachineLabelDelegate:class {
    
    func updateLabel(_ time:Int);
    func updateProgressBar(_ value:Float, duration:Float);
    func updateUI();
    func pressButton();
    
}
