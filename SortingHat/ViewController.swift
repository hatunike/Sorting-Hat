//
//  ViewController.swift
//  SortingHat - A ViewController designed to sort students into their appropriate houses.
//  It analyzes the soul and puts you where you are destined to be.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, HousePickerDelegate {

    @IBOutlet var nameField: UITextField!
    
    var height:CGFloat = 600
    var currentRandomHouse: HogwartsHouse = .Ravenclaw
    
    @IBAction func sortMeButtonPressed() {
        studentHasBeenSorted(HogwartsHouse.randomHouse(), name: nameField.text)
    }
    
    func studentHasBeenSorted(house:HogwartsHouse, name:String?) {
        let label = UILabel.potterStyledLabel(house)
        label.frame = CGRectMake(0, 2000, view.frame.width, 40)
        label.text = "\(name!) : \(house)!!!"
        
        self.view.addSubview(label)
        print(label.text)
        // 2 - Animating label into place
        UIView.animateWithDuration(0.75, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            label.frame = CGRectMake(0, self.height, self.view.frame.width, 40)
            
            }, completion: nil)
        height = height - 45
        
        // 3 - Check and Remove all views if necessary
        if self.view.explosionRemove(height, classToExplode: UILabel.self) {
            height = 600
        }
    }
    
    @IBAction func pickHouseSelected(sender: AnyObject) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let housePicker:HousePickerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("housepicker") as! HousePickerViewController
        housePicker.delegate = self
        presentViewController(housePicker, animated: true, completion: nil)
        
    }
    
    func viewController(controller: UIViewController, didSelect house: HogwartsHouse) {
        controller.dismissViewControllerAnimated(true, completion: nil)

        studentHasBeenSorted(house, name: nameField.text)
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        sortMeButtonPressed()
        
        return true
    }
    
    func createPotion() {
        
        let felixFelicis = PotionRecipe.felixFelicis()
        print("The potion has \(felixFelicis.numberOfIngredients())")
        print(felixFelicis)
    }
    
    func createPotion2() {
        
        let felixFelicis = PotionRecipe.felixFelicis()
        
        print("How many ingredients are in Felix Felicis? : \(felixFelicis.ingredients.count)")
        
    }
    
    func availableHousesInViewController(controller: UIViewController) -> [HogwartsHouse] {
        return [.Gryffindor, .Ravenclaw, .Hufflepuff, .Slytherin, .Squib]
    }
}





