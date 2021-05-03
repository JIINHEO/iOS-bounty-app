//
//  DetailViewController.swift
//  BountyList
//
//  Created by 허지인 on 2021/05/01.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
    

    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        
        if let bountyInfo = self.viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLable.text = bountyInfo.name
            bountyLable.text = "\(bountyInfo.bounty)"
        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo? ){
        bountyInfo = model
    }
}
