//
//  HousePickerViewController.swift
//  PracticeProtocols
//
//  Created by Charles Hart on 10/27/15.
//  Copyright © 2015 busybusy. All rights reserved.
//

import UIKit

protocol HousePickerDelegate {
    
    func viewController(controller:UIViewController, didSelect house:HogwartsHouse)
    
    func availableHousesInViewController(controller:UIViewController) -> [HogwartsHouse]
}


class HousePickerViewController: UIViewController {
    
    var delegate:HousePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.availableHousesInViewController(self)
    }
    
    
    @IBAction func ifGryffindorSelected(sender: AnyObject) {
        
        delegate?.viewController(self, didSelect: HogwartsHouse.Gryffindor)
    }
    
    @IBAction func ifRavenclawSelected(sender: AnyObject) {
        
        delegate?.viewController(self, didSelect: HogwartsHouse.Ravenclaw)
    }
    
    @IBAction func ifSlytherinSelected(sender: AnyObject) {
        
        delegate?.viewController(self, didSelect: HogwartsHouse.Slytherin)
    }
    
    @IBAction func ifHufflepuffSelected(sender: AnyObject) {
        
        delegate?.viewController(self, didSelect: HogwartsHouse.Hufflepuff)
    }
    
    @IBAction func ifSquibSelected(sender: AnyObject) {
        
        delegate?.viewController(self, didSelect: HogwartsHouse.Squib)
    }
}
