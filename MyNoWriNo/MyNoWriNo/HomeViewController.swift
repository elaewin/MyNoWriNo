//
//  HomeViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/5/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var allProjects = [Project]()
    
    // put outlets here
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let nib = UINib(nibName: "projectCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: ProjectCollectionCell.identifier)
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    @IBAction func newProjectButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: NewProjectViewController.identifier, sender: nil)
    }
    
    

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as! ProjectCollectionCell
        
        var currentProject: Project
        
        currentProject = allProjects[indexPath.row]

        cell.project = currentProject
        
        return cell
    }
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allProjects.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
