import UIKit

class AdditionalVC: UIViewController {
//MARK: - UI
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
// model
    var model = AdditionalModel()
    
//MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = model.weatherModel!.name
        
        model.AdditionalVC = self
        model.configurate()
    }
}
