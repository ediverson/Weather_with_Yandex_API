import UIKit

class MainTVC: UITableViewController {
//model
    var model = MainModel()
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Порогноз погоды"
                   
        model.mainTVC = self
        model.addCities()
        model.createSearch()
        
    }
    
//MARK: - Navigation bar button
    @IBAction func addButton(_ sender: Any) {
        alertPlusCity(name: "Добавить город", plaseholer: "Введите название") { (city) in
            guard !city.isEmpty else {
                self.model.showAlert(message: "Введите название")
                return }

            self.model.cities.append(city)
            self.model.arrayOfCities.append(self.model.emptyCity)
            self.model.addCities()
            
            self.tableView.reloadData()
        }
    }
    
// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.searchFiltered{
            return model.arrayOfFilteredCities.count
        }
        return model.arrayOfCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        var weather = Weather()
        
        if model.searchFiltered {
            weather = model.arrayOfFilteredCities[indexPath.row]
        } else {
            weather = model.arrayOfCities[indexPath.row]
        }
        
        cell.createCell(weather: weather)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, complitionHandler) in
            
            let editingRow = self.model.cities[indexPath.row]
            if let index = self.model.cities.firstIndex(of: editingRow) {
                
                if self.model.searchFiltered {
                    self.model.arrayOfFilteredCities.remove(at: indexPath.row)

                } else {
                    self.model.arrayOfCities.remove(at: index)
                }
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAdd" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }

            if model.searchFiltered {
                let filteredWeather = model.arrayOfFilteredCities[indexPath.row]
                let vc = segue.destination as! AdditionalVC
                vc.model.weatherModel = filteredWeather
            } else {
                let cityWeather = model.arrayOfCities[indexPath.row]
                let vc = segue.destination as! AdditionalVC
                vc.model.weatherModel = cityWeather
            }
        }
    }
}

//MARK: - Search extension
extension MainTVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filter(searchController.searchBar.text!)
    }
    
    private func filter(_ searchText: String) {
        model.arrayOfFilteredCities = model.arrayOfCities.filter( {$0.name.contains(searchText)})
        tableView.reloadData()
    }
}

