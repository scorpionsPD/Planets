//
//  HomeScreenVM.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import Foundation
import Networking

class HomeScreenVM {
    private(set) var planets: Planets?{
        didSet{
            self.reloadList()
        }
    }
    var reloadList = {() -> () in}
    
    func numberOfRows() -> Int {
        return self.planets?.results?.count ?? 0
    }
    func modelAt(_ index: Int) -> Result? {
        return self.planets?.results?[index]
    }
    func getHomeScreenData() {
        
        let listofPicsURL = "\(Constants.Backend.url)"
        
        let listResource = Resource<Planets>(url: listofPicsURL, method: .get, p: {
            data -> Planets in
            let pics = try? JSONDecoder().decode(Planets.self, from: data)
            return pics!
        })
        
        Webservice.load(resource: listResource) { [weak self] result in
            
            switch result {
            case .failure:
                print("something went wrong")
                break
            case .success(let result):
                self?.planets = result
            }
        }
    }
}

