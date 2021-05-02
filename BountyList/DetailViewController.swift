//
//  DetailViewController.swift
//  BountyList
//
//  Created by 허지인 on 2021/05/01.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    //MVVM
    
    //Model
    // - BountyInfo 라는 하나의 오브젝트로 만들었으면 좋겠다
    // > BountyInfo 만들자
    
    //View
    // - imgView, nameLabel, bountyLable
    // > view들은 ViewModel을 통해서 구성되기 ?
    //
    
    //ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
    
    //이걸 앞에서 받아와야함
    
//    var name: String?
//    var bounty: Int?
    
    var bountyInfo: BountyInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad() //뷰컨트롤러가 메모리에 올라온 시점에 호출된다. (보이기 바로 직전에 호출됨)
        updateUI()
    }
    //ui Outlet 스토리보드 연결
    //데이터에 필요한 프로퍼티 추가하고
    //뷰 컨트롤러가 뜨기 직전에 업데이트 ui한다.
    
    func updateUI() {
        if let bountyInfo = self.bountyInfo {
            imgView.image = bountyInfo.image
            nameLable.text = bountyInfo.name
            bountyLable.text = "\(bountyInfo.bounty)"
        }
        
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//
//            imgView.image = img
//            nameLable.text = name
//            bountyLable.text = "\(bounty)"
//        }
    }
    
    //버튼을 눌렀을때 닫히는 액션
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)//completion 사라지고 나서 그 이후의 동작
    }
}
