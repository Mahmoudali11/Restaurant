//
//  Home.swift
//  Restaurants
//
//  Created by Admin on 1/31/19.
//  Copyright © 2019 Mahmoudali. All rights reserved.
//

import UIKit
import CoreData
class Home: UITableViewController{
    let cmd=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var RestaurantOp:[RestaurantEntity]!
       override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromDS()
        
    }
    override func viewDidAppear(_ animated: Bool) {
         loadDataFromDS()
        tableView.reloadData()
     }
    func loadDataFromDS()  {
        let request:NSFetchRequest<RestaurantEntity>=RestaurantEntity.fetchRequest()
        
        do{
            try RestaurantOp=cmd.fetch(request)
        }
        catch{
            
        }
        
    }
   
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let callAction={(action:UIAlertAction) in
//            let alert=UIAlertController(title: "Sorry!", message:"Not Available", preferredStyle:.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//        let alert=UIAlertController(title: "Hi", message: "what do you want?", preferredStyle: .actionSheet)
//        let checkIn=UIAlertAction(title: "CheckIn", style: .default, handler: {(a)in
//            let cell=tableView.cellForRow(at: indexPath)
//           cell?.accessoryType = UITableViewCellAccessoryType.checkmark
//            self.arrIsVisited[indexPath.row]=true
//         } )
//        
//      let cancle=UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//        let call=UIAlertAction(title: "call 12312-3-\(indexPath.row)", style: .default, handler:callAction)
//        alert.addAction(call)
//        alert.addAction(checkIn)
//        alert.addAction(cancle)
//        present(alert, animated: true, completion: nil)
//      tableView.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
            return "RestPIN"
           }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
     override var prefersStatusBarHidden: Bool{
         return true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RestaurantOp.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c=UITableViewCell()

        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell{
        cell.img.image = UIImage(data: RestaurantOp[indexPath.row].image! as Data)
        
  cell.name.text=RestaurantOp[indexPath.row].name
        cell.location.text=RestaurantOp[indexPath.row].location
        cell.type.text=RestaurantOp[indexPath.row].type
            cell.img.clipsToBounds=true
            cell.img.layer.cornerRadius=30.0
            if (RestaurantOp[indexPath.row].isVisited){
                cell.accessoryType = .checkmark
            }
            else{
                cell.accessoryType = .none

            }
          

                 return cell
        }
        return c
    }
    @IBAction func unWindSegueToHome(segue:UIStoryboardSegue){
        
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let sharing=UITableViewRowAction(style: .default, title: "Share", handler: { a in
        
        let defaultText=" hiiiiiiii"+self.RestaurantOp[indexPath.row].name!
            
          let defaultImg=UIImage(data: self.RestaurantOp[indexPath.row].image as! Data  )
            let act=UIActivityViewController(activityItems: [defaultImg,defaultText], applicationActivities: nil)
            self.present(act, animated: true, completion: nil)
            
            
        
        })
        let deleting=UITableViewRowAction(style: .default, title:"Delete", handler:{a in
           
            self.cmd.delete(self.RestaurantOp[indexPath.row])
             self.RestaurantOp.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
})
         sharing.backgroundColor=UIColor.gray
        return [sharing,deleting]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    //delete row
    
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "detailed" {
            if let indexPath=tableView.indexPathForSelectedRow{
            let destinationViewController=segue.destination as! detialedViewController
                destinationViewController.restaurant=RestaurantOp[indexPath.row]
            }
            
        }
    }
   

}
