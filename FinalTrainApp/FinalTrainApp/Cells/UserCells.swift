//
//  UserCells.swift
//  FinalTrainApp
//
//  Created by Vu Thanh Nam on 30/05/2022.
//

import UIKit

class UserCells: UITableViewCell {

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblLogin: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ivAvatar.applyshadowWithCorner(containerView:ivAvatar , cornerRadious: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
