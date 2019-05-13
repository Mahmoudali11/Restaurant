//
//  reviewViewController.swift
//  Restaurants
//
//  Created by Admin on 2/7/19.
//  Copyright © 2019 Mahmoudali. All rights reserved.
//

import UIKit

class reviewViewController: UIViewController {
    var resaturant:RestaurantEntity!
    
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var img: UIImageView!
        override func viewDidLoad() {
        super.viewDidLoad()
         img.image=UIImage(data: resaturant.image as! Data)
            containerView.transform=CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, animations: { self.containerView.transform=CGAffineTransform.identity})
            let blurEffect=UIBlurEffect(style: .dark)
            let visualEffect=UIVisualEffectView(effect: blurEffect)
            visualEffect.frame=view.bounds
            backImg.addSubview(visualEffect)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier=="review"{
//            let
//            
//           }
//    

}
