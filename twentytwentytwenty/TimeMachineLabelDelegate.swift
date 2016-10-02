
import Foundation

protocol TimeMachineLabelDelegate:class {
    func updateLabel(time:String);
    func updateProgressBar(value:Float, duration:Float);
    func resetProgressBar();
    
}