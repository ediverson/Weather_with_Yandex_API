import UIKit

class MainCell: UITableViewCell {
//MARK: - UI
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
//MARK: - Create Cell
    func createCell(weather: Weather){
        cityLabel.text = weather.name
        conditionLabel.text = weather.conditionString
        tempLabel.text = "\(weather.temp)"
    }

//MARK: - Select
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
