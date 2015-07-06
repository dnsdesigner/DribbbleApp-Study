//
//  ShotCollectionViewCell.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 29/06/15.
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import UIKit

class ShotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    func loadShot(shot: Shot) {
        
        self.titleLabel.text = shot.title
        self.userNameLabel.text = shot.userName
    }
    
    
    
}
