//
//  HomeViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/5/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import EventKit

class HomeViewController: UIViewController {

    var allProjects = [Project]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let kDisplayColumns = 2
    
    var selectedProject: Project?
    var selectedIndex: Int?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.allowsMultipleSelection = false
        
        self.collectionView.delegate = self
        
        
        let newProjectNib = UINib(nibName: "NewProjectCell", bundle: nil)
        self.collectionView.register(newProjectNib, forCellWithReuseIdentifier: CreateNewProjectCell.identifier)
        
        let nib = UINib(nibName: "projectCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: ProjectCollectionCell.identifier)
        
        self.collectionView.collectionViewLayout = HomeCollectionViewFlowLayout(columns: kDisplayColumns)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destinationController = segue.destination as? NewProjectViewController {
            destinationController.delegate = self
        }
        if let tabBarController = segue.destination as? ProjectTabBarController {
            if let project = self.selectedProject {
                tabBarController.project = project
            }
            if let index = self.selectedIndex {
                tabBarController.indexPassedThrough = index
                print("Index: \(self.selectedIndex)")
            }
        }
        
    }



    //MARK: Actions
    @IBAction func newProjectButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: NewProjectViewController.identifier, sender: nil)
    }

    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == allProjects.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateNewProjectCell", for: indexPath) as! CreateNewProjectCell
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionCell", for: indexPath) as! ProjectCollectionCell
            
            var currentProject: Project
            
            currentProject = allProjects[indexPath.row]
            
            cell.project = currentProject
            
            return cell
        }
    }
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allProjects.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == allProjects.count {
            self.performSegue(withIdentifier: NewProjectViewController.identifier, sender: nil)
        } else {
            self.selectedProject = allProjects[indexPath.row]
            self.selectedIndex = indexPath.row
            self.performSegue(withIdentifier: "projectTabBarSegue", sender: nil)
        }
        
    }
}

extension HomeViewController: NewProjectControllerDelegate {
    
    func newProjectCreated(project: Project) {
        allProjects.append(project)
        for project in allProjects {
            print("Project: \(project.name)")
        }
    }
}

extension HomeViewController: DetailsViewControllerDelegate {
    
    func deleteProject(index: Int) {
        allProjects.remove(at: index)
        print("Removed project at index \(index)")
    }
}




