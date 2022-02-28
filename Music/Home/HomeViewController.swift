//
//  ViewController.swift
//  Music
//
//  Created by Paulo Rodrigues on 28/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = self.homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

