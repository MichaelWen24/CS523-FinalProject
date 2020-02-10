//
//  HomeTableViewCell.swift
//  iOSPlayer
//
//  Created by Michael Wen on 5/7/19.
//  Copyright © 2019 Yining Wen. All rights reserved.
//

import UIKit

//struct hometableviewcell{
////    var celltitle = ""
////    var cellinfo = ""
//    let celltitle:String
//    let cellinfo:String
//}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var videoimage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var press: UIButton!
    @IBAction func pressbutton(_ sender: Any) {
    }
    
//    var homecell = [hometableviewcell]()
    var celltitle:String!
    var cellinfo:String!
    
    struct HomeTableViewCell{
        var celltitle:String
        var cellinfo:String
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        homecell.append(title?.text)
        celltitle = title.text
        cellinfo = info.text
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        title.text = "testmv1"
        info.text = "mp4"
        
        
        // Configure the view for the selected state
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let AllCustomerController = segue.destination as! AllCustomerController
//        AllCustomerController.receivedinfo = self.title.text!
//        AllCustomerController.receivedtitle = self.info.text!
//    }
//
}
