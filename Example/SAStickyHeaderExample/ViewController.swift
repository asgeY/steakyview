//
//  ViewController.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

/**
Github example images from: https://octodex.github.com
*/
enum SASGithubImage: String {
    case Gracehoppertocat
    case HipsterPartycat
    case Mountietocat
    case Octoliberty
    case ProfessortocatV2
}

class ViewController: UITableViewController {
    
    // MARK:
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK:
    // MARK: Setup
    
    func setupView() {
        // list of github images for example, for DEMO purposes i've loaded everything first but can easily be added afterworld with images.append()
        let images = [UIImage(named: SASGithubImage.Gracehoppertocat.rawValue), UIImage(named: SASGithubImage.HipsterPartycat.rawValue), UIImage(named: SASGithubImage.Mountietocat.rawValue), UIImage(named: SASGithubImage.Octoliberty.rawValue), UIImage(named: SASGithubImage.ProfessortocatV2.rawValue)]
        
        // add SAStickyHeaderView with a frame and optional image array.
        tableView.tableHeaderView = SAStickyHeaderView(frame: CGRectMake(0, 0, CGRectGetWidth(view.frame), 400), table: tableView, image: images)
    }
}
