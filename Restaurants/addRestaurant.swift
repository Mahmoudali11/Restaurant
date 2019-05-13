//
//  addRestaurant.swift
//  Restaurants
//
//  Created by Admin on 2/7/19.
//  Copyright © 2019 Mahmoudali. All rights reserved.
//

import UIKit
import CoreData
class addRestaurant: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
 var restaurant:RestaurantEntity!
    let cmd=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
            if(restaurant != nil){
            location.text=restaurant.location
            name.text=restaurant.name
         type.text=restaurant.type
                            }
        

            }
    @IBAction func saveData(_ sender: AnyObject) {
        
        
        if  name.text != ""  && location.text != "" && type.text != ""{
            
            var beenH=false
            if yesBtn.backgroundColor==UIColor.red{
            beenH=true
            }
            else{
                beenH=false
            }
                   do{
                    
                    
                    if (restaurant == nil){restaurant=RestaurantEntity(context: cmd)
                    }

                    restaurant.name=name.text
                     restaurant.type=type.text
                   restaurant.location=location.text
                 restaurant.isVisited=beenH
                   if let img=img.image{
                    let imgData=UIImagePNGRepresentation(img)
                        restaurant.image=NSData(data: imgData!)
                   }

              try cmd.save()
            }
            catch{
            print("noooooo")
            }
           dismiss(animated: true, completion: nil)
        }
        else{
            let alert=UIAlertController(title: nil, message: "you must fill all fields!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    @IBAction func cangeColor(_ sender: AnyObject) {
        if sender.currentTitle=="yes"{
            yesBtn.backgroundColor=UIColor.red
            noBtn.backgroundColor=UIColor.gray
           // restaurant.isVisited=true
        }
        else{
            
            yesBtn.backgroundColor=UIColor.gray
            noBtn.backgroundColor=UIColor.red
            //restaurant.isVisited=false

            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectImg=info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("hi mahmoud")

            img.image=selectImg
            
        }
        dismiss(animated: true, completion: nil)
        

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==0{
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker=UIImagePickerController()
                imagePicker.delegate=self
                imagePicker.allowsEditing=false
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
                
                
            }
            
            
        }
        
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
