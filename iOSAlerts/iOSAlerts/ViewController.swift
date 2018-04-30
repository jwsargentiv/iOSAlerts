//
//  ViewController.swift
//  iOSAlerts
//
//  Created by James Sargent on 4/27/18.
//  Copyright © 2018 URBN. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationButton = UIButton()
    let notificationButton = UIButton()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        locationButton.backgroundColor = .red
        notificationButton.backgroundColor = .blue
        locationButton.setTitle("Location", for: .normal)
        notificationButton.setTitle("Notification", for: .normal)
        
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        
        //        view.addSubview(locationButton)
        //        locationButton.translatesAutoresizingMaskIntoConstraints = false
        //        locationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        //        locationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        //        locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        locationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //
        //        view.addSubview(notificationButton)
        //        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        //        notificationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        //        notificationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        //        notificationButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 30).isActive = true
        //
        
        let stackView = UIStackView(arrangedSubviews: [locationButton, notificationButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func locationButtonTapped() {
        switch CLLocationManager.authorizationStatus() {
        default:
            locationManager.requestAlwaysAuthorization()
        }
        print("location button tapped")
    }
    
    @objc func notificationButtonTapped() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
        })
    }
    
    //    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    //
    //    }
    //
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //
    //    }
    //
    //    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    //
    //    }
}

