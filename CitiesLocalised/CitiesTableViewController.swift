import UIKit
import CoreLocation

class CitiesTableViewController: UITableViewController {

    var cities: [CLLocation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = prepareCities()
    }
    
    // MARK: - Location Methods
    
    private func prepareCities() -> [CLLocation]! {
        var cities = [CLLocation]()
        
        cities.append(coords(55.6761, 12.5683)) // Copenhagen, Denmark
        cities.append(coords(55.7558, 37.6173)) // Moscow, Russia
        cities.append(coords(59.32, 18.06))     // Stockholm, Sweden
        cities.append(coords(52.36, 4.9))       // Amsterdam, Netherlands
        cities.append(coords(57.7, 11.9667))    // Gothenburg, Sweden
        cities.append(coords(60.1699, 24.94))   // Helsinki, Finland
        cities.append(coords(56.8587, 35.9176)) // Tver', Russia
        
        return cities
    }
    
    private func coords(latitude: CLLocationDegrees, _ longitude: CLLocationDegrees) -> CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    private func setCity(location: CLLocation, label: UILabel) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let placemarks = placemarks,
                let city = placemarks.first?.locality,
                let country = placemarks.first?.country  {
                print(placemarks)
                label.text = city + ", " + country
            }
        }
    }
    
    // MARK: - TableView Methods

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath)
        setCity(cities[indexPath.row], label: cell.textLabel!)
        return cell
    }
}
