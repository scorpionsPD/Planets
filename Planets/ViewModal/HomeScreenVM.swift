//
//  HomeScreenVM.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import Foundation
import Networking

class HomeScreenVM {
    var planets: Planets?{
        didSet{
            guard let data = planets?.results else {
                fatalError("could not able to load planets")
            }
            Utils().save(data) // saving data for offline access
            self.reloadList() // reloading home screen planet's list
        }
    }
    private var errorAlert = CustomAlert()
    var reloadList = {() -> () in}
    
    /// returns total number of visible planet row's
    func numberOfRows() -> Int {
        return self.planets?.results?.count ?? 0
    }
    
    /// returns sinle planet modal
    func modelAt(_ index: Int) -> Result? {
        return self.planets?.results?[index]
    }
    
    ///fetch data for online mode
    func getHomeScreenData() {
        
        let listofPlanetURL = "\(Constants.Backend.url)"
        
        let listResource = Resource<Planets>(url: listofPlanetURL, method: .get, p: {
            data -> Planets in
            let planets = try? JSONDecoder().decode(Planets.self, from: data)
            return planets!
        })
        errorAlert.delegate = self
        Webservice.load(resource: listResource) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.errorAlert.showErrorAlert(error: error as! NetworkError)
                break
            case .success(let result):
                self?.planets = result
            }
        }
    }
}
/// delegate to load offline data
extension HomeScreenVM: ErrorDelegates {
    func loadOfflineData() {
        if let planets = Utils().load() {
            if (planets.count != 0){ // checking if there is a previously saved data
                self.planets = Planets(results: planets)
            } else {errorAlert.showErrorAlert(error: .emptyResource)}
        }
    }
}
