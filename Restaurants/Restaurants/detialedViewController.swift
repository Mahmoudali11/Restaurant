//
//  detialedViewController.swift
//  Restaurants
//
//  Created by Admin on 2/4/19.
//  Copyright © 2019 Mahmoudali. All rights reserved.
//

import UIKit
import  MapKit
import CoreData
class detialedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     let cmd=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var makit: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restaurantImg: UIImageView!
    
    var restaurant:RestaurantEntity!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer=UITapGestureRecognizer(target: self
            , action: #selector(showMap))
        makit.addGestureRecognizer(tapRecognizer)
        restaurantImg.image=UIImage(data: restaurant.image! as Data)
        
        
        tableView.backgroundColor=UIColor(red: 69.0/255, green: 182.0/255, blue: 251.0/255, alpha: 0.2)
        tableView.separatorColor=UIColor(red: 49.0/255, green: 236.0/255, blue: 111.0/255, alpha: 0.2)
        //tableView.tableFooterView=UIView(frame:.zero)

      // cell self resizing
        tableView.estimatedRowHeight=36.0
        tableView.rowHeight=UITableViewAutomaticDimension
        
       
    }
    func showMap() {
        print("errrrrrrr")
        performSegue(withIdentifier: "showMapKit", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailedTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.field.text="Name:"
            cell.value.text=restaurant.name
        case 1:
            cell.field.text="Location:"
            cell.value.text=restaurant.location
        case 2:
            cell.field.text="Type:"
            cell.value.text=restaurant.type
        case 3:
            cell.field.text="Phone number:"
            cell.value.text=restaurant.phone
        case 4:
            cell.field.text="Been Here?:"
            cell.value.text=(restaurant.isVisited) ? "yes i have\(restaurant.rating)":"No"

            
        default:
            cell.field.text="Name:"
            cell.value.text=restaurant.name

        }
        //to make the cell returned is transparent
       cell.backgroundColor=UIColor.clear
        
        return cell
        
            }
    //unwind
    @IBAction func close(segue:UIStoryboardSegue){
        
    }
    //unwindSegueforRating
    @IBAction func ratingAction(segue:UIStoryboardSegue){
        switch segue.identifier!{
        case "great":
            restaurant.rating="i apbolutely like it"
            
            
        case "good":
            restaurant.rating="really good"
        case "nogood":
            restaurant.rating="i dont't like it"
        default:
            break
        }
        do{
            try cmd.save()
            
        }
        catch{
            
        }

        tableView.reloadData()
        
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="review"{
            let destination=segue.destination as! reviewViewController
             destination.resaturant=restaurant
             }
        if segue.identifier=="update"{
            let destination=segue.destination as! addRestaurant
            destination.restaurant=restaurant
        }

    }

}
