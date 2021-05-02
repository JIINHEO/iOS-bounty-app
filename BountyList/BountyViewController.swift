//
//  BountyViewController.swift
//  BountyList
//
//  Created by 허지인 on 2021/04/27.

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //    MVVM 
    //
    //    Model
    //     - BountyInfo 라는 하나의 오브젝트로 만들었으면 좋겠다
    //     > BountyInfo 만들자
    //
    //    View
    //     - ListCell
    //     > ListCell 필요한 정보를 ViewModel한테서 받아야겠다
    //     > ListCell ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    //
    //
    //    ViewModel
    //     - BountyViewModel
    //     > BountyViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들기
    //     > 모델 가지고 있기 ,, BountyInfo 들
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 3300000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 4400000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    //    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    //    let bountyList = [3300000, 50, 4400000, 300000000, 16000000, 8000000, 77000000, 120000000]
    
    
    //세그웨이를 수행하기 직전에 준비하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{ //이 세그웨이를 수행함
            let vc = segue.destination as? DetailViewController
            //우리가 지칭하는 destination segue 는 detailViewVontroller 이다.
            if let index = sender as? Int { //몇번째인지 다운캐스팅
                
                let bountyInfo = bountyInfoList[index]
                vc?.bountyInfo = bountyInfo
                //                vc?.name = bountyInfo.name
                //                vc?.bounty = bountyInfo.bounty
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //UITableVIewData Source
    //몇개를 보여줄까요?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return bountyList.count
        return bountyInfoList.count
    }
    
    //셀은 어떻게 표현할거야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell           else {
            return UITableViewCell()
        }
        //        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        //        cell.imgView.image = img
        //        cell.nameLable.text = nameList[indexPath.row]
        //        return cell
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLable.text = bountyInfo.name
        cell.bountyLable.text = "\(bountyInfo.bounty)"
        return cell
        
        //if문으로도 가능
        //        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell  {
        //            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        //            cell.imgView.image = img
        //            cell.nameLable.text = nameList[indexPath.row]
        //            cell.bountyLable.text = "\(bountyList[indexPath.row])"
        //            return cell
        //        }else{
        //            return UITableViewCell()
        //        }
    }
    
    //셀이 클릭되었을때 어떻게 반응할거야?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath)")
        
        //아까 연결했던 세그웨이를 수행해라
        performSegue(withIdentifier: "showDetail", sender: indexPath.row) // sender : 세그웨이를 수행하는데 있어서 특정 오브젝트를 껴서 보낸다. sender에 정보를 넣어서 보낸다.
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
}

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
