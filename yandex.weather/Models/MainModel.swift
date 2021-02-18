import Foundation
import UIKit

class MainModel {
// ViewController
    weak var mainTVC: MainTVC?
    
// emtpy values
    var arrayOfCities = [Weather]()
    var arrayOfFilteredCities = [Weather]()
    let emptyCity = Weather()
    
// value for default view
    var cities: [String] = ["Москва",
                            "Лос-Анджелес",
                            "Владивосток",
                            "Майами",
                            "Сочи",
                            "Хьюстон",
                            "Воронеж",
                            "Нью-Йорк",
                            "Геленджик",
                            "Сан-Франциско"]
    
// create Cities array
    func addCities() {
        if arrayOfCities.isEmpty {
            arrayOfCities = Array(repeating: emptyCity, count: cities.count)
        }

        getCityWeather(citiesArray: cities) { (index, weather) in
            self.arrayOfCities[index] = weather!
            self.arrayOfCities[index].name = self.cities[index]
            DispatchQueue.main.async {
                self.mainTVC?.tableView.reloadData()
            }
        }
}

    
//MARK: - Search
    let search = UISearchController(searchResultsController: nil)
    
    var searchIsEmpty: Bool {
        guard let text = search.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var searchFiltered: Bool {
        return search.isActive && !searchIsEmpty
    }
    
    func createSearch() {
        search.searchResultsUpdater = mainTVC
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Поиск"
        mainTVC?.navigationItem.searchController = search
        mainTVC?.navigationItem.hidesSearchBarWhenScrolling = true
        mainTVC?.definesPresentationContext = true
    }
    
    
    //MARK: - Create Alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: .none, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            
        }
        alert.addAction(okButton)
        mainTVC?.present(alert, animated: true, completion: nil)
    }
}
