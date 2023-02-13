//
//  Cell.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 20/06/2022.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bind(user:User){
        lblName.text = user.login.firstUppercased
        ivAvatar.loadUrl(user.avatar_url)
     
    }

}
