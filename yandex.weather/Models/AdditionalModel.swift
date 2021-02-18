import Foundation
import UIKit
import SwiftSVG

class AdditionalModel {
// model
    var weatherModel: Weather?
    weak var AdditionalVC: AdditionalVC?
// emply icon
    private var weatherIcon = UIView()
 
//MARK: - Configurate AdditionalVC
    func configurate() {
        guard weatherModel != nil else { return }

        AdditionalVC!.tempLabel.text = "\(weatherModel!.temp)"
        AdditionalVC!.feelsLikeLabel.text = "\(weatherModel!.feelsLike)"
        AdditionalVC!.maxTempLabel.text = "\(weatherModel!.tempMax)"
        AdditionalVC!.minTempLabel.text = "\(weatherModel!.tempMin)"
        AdditionalVC!.pressureLabel.text = "\(weatherModel!.pressure)"
        AdditionalVC!.windSpeedLabel.text = "\(weatherModel!.windSpeed)"
//  Icon
        getIcon(urlKey: weatherModel!.icon)
        AdditionalVC!.iconView.addSubview(weatherIcon)
    }
    
//MARK: - Create Icon
    private func getIcon(urlKey: String) {
        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(urlKey).svg")
        
        self.weatherIcon = UIView(SVGURL: url!) { (icon) in
            icon.resizeToFit(self.AdditionalVC!.iconView.bounds)
        }
    }
}
