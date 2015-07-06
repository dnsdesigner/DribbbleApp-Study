//
//  MainViewController.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 29/06/15.
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let dribbbleHTTPClient = DribbleHTTPClient()
    var shotsArray: Array<Shot>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Carregar as shots
        self.loadData()
        
    }
    
    func loadData() {
        self.dribbbleHTTPClient.getShots { (shots) -> Void in
            
            self.shotsArray = shots
            self.collectionView.reloadData()
            
            println("Executando clousure na main")
            /*for shot in self.shotsArray! {
                println(shot.title)
            }*/
            
        }
    }
    
    // MARK: Collection View DataSource and Delegates
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let totalShots = self.shotsArray?.count {
            return totalShots
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let identifier = Reusable.ShotCell.identifier!
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! ShotCollectionViewCell
        
        if let shot = self.shotsArray?[indexPath.row] {
            cell.loadShot(shot)
            //println("Row: \(indexPath.row) Title: \(shot.title)")
        }
        
        return cell
        
    }
    
    // MARK: FlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        // Crio a definição de espaço ideal entre os itens
        let idealSpace: CGFloat = 6
        
        // Cria uma variável para receber o flowlayout atual
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        // Zera os espaços existentes
        flowLayout.minimumInteritemSpacing = 0
        
        // Seto o espaço miníno entre linha
        flowLayout.minimumLineSpacing = idealSpace
        
        // Usa uma variável para armazanar a borda atual
        //let border = flowLayout.sectionInset.left - flowLayout.sectionInset.right
        //println("Section Inset Left: \(flowLayout.sectionInset.left) | Section Inset Right: \(flowLayout.sectionInset.right)")
        
        let itemWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing
        println("Item size width: \(flowLayout.itemSize.width) | Minimum item Spacing: \(flowLayout.minimumInteritemSpacing)")
        
        // Espaço disponível na tela
        let widthAvailable = collectionView.bounds.width
        
        let maxPerRow = floor(collectionView.bounds.width / itemWidth)
        println("Item size : \(itemWidth) | Collection size: \(collectionView.bounds.width) | Per row \(maxPerRow)")
        
        // Calcula o número de espaço entre itens e espaço usado entre eles
        let spaces = maxPerRow + 1
        let usedSpace = itemWidth * maxPerRow
        
        // Calcula o espaço necessário entre os itens
        let space = floor((collectionView.bounds.width - usedSpace) / spaces)
        
        println("Space: \(space)")
        
        let increaseWidth = floor((((space - idealSpace) * spaces) / maxPerRow))
        println("Increase Width: \(increaseWidth)")
        
        //flowLayout.itemSize = CGSizeMake(178, 160)
        //let novaLargura = ((space * spaces) - 18) / spaces
        
        let idealWidth = itemWidth + increaseWidth
        println("Ideal Width: \(idealWidth)")
        
        let idealHeight = round(((flowLayout.itemSize.height / itemWidth) * idealWidth))
        println("Ideal Height: \(idealHeight)")
        
        // Setar tamanho ideal
        flowLayout.itemSize = CGSizeMake(idealWidth, idealHeight)
        
        return UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    }
    
    
    
    

}
