//
//  Utils.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import Foundation

class Utils {
    
    private let KeyForUserDefaults = "planets"

    func save(_ planets: [Result]) {
        let data = planets.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
    }
    func load() -> [Result]? {
        guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
            return []
        }
        return encodedData.map { try! JSONDecoder().decode(Result.self, from: $0) }
    }
}
