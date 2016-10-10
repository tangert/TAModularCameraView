//
//  ViewController.swift
//  TRModularCameraView
//
//  Created by Tyler Angert on 10/6/16.
//  Copyright © 2016 Tyler Angert. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var images: [UIImage] = [UIImage]()
    var placeholderCellNib: UINib? = UINib(nibName: "PlaceholderCell", bundle:nil)
    var cameraViewNib: UINib? = UINib(nibName: "CameraViewCell", bundle: nil)

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding images to the images array
        for i in 0...6 {
            images.append(UIImage(named: "\(i+1)")!)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(placeholderCellNib, forCellReuseIdentifier: "placeholderCell")
        self.tableView.register(cameraViewNib, forCellReuseIdentifier: "cameraViewCell")
        self.tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView,
                                 numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func tableView(_ tableView: UITableView,
                                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //every 4th cell except the first one, it shows a camera view as an emotional "checkpoint"
        if (indexPath.row % 4 == 0 && indexPath.row != 0) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cameraViewCell", for: indexPath) as! CameraViewCell
            
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "placeholderCell", for: indexPath) as! PlaceholderCell
            cell.placeholderImage.image = images[indexPath.row]
            
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            
            return cell

        }
        
    }
    
}
