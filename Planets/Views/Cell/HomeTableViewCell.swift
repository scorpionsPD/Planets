//
//  HomeTableViewCell.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    var cellData:Result?{
        didSet{
            guard let data = cellData else{return}
            nameLbl.text = data.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
