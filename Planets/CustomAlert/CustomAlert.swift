//
//  Utils.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import Foundation
import UIKit
import Networking

protocol ErrorDelegates {
    func loadOfflineData()
}

struct CustomAlert {
    
    var delegate:ErrorDelegates?
    /// error alert in case of no network available
    private func showNerworkErrorAlert() {
        let alert = UIAlertController(title: "Network Error", message: "You are offline. Do you want to load offline data?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Please", style: UIAlertAction.Style.default, handler: { _ in
            delegate?.loadOfflineData()
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: UIAlertAction.Style.destructive, handler: { _ in
        }))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    /// error alert in case of no data available
    private func showEmptyResourceAlert() {
        let alert = UIAlertController(title: "No Data", message: "You do not have offline data. Please try connecting to a network.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    /// error alert in case of something happed wrong at backend
    private func showParseUrlErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    func showErrorAlert(error: NetworkError) {
        switch error {
        case .parseUrl:
            showParseUrlErrorAlert()
            break
        case .parseJson:
            break
        case .parseData:
            break
        case .emptyResource:
            showEmptyResourceAlert()
            break
        case .reachability:
            showNerworkErrorAlert()
            break
        case .defaultError:
            showParseUrlErrorAlert()
        }
    }
}
