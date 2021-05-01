//
//  BountyViewController.swift
//  BountyList
//
//  Created by 허지인 on 2021/04/27.

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [3300000, 50, 4400000, 300000000, 16000000, 8000000, 77000000, 120000000]
    
    //세그웨이를 수행하기 직전에 준비하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //테이블 뷰에서 세그웨이를 수행하라고 함수를 호출했는데
        //수행하기 직전에 준비하는거
        //DetailViewController에게 데이터를 줄것이다.
        //몇번째 셀을 선택했는지 알수 있다.
        
        if segue.identifier == "showDetail"{ //이 세그웨이를 수행함
            let vc = segue.destination as? DetailViewController
            //우리가 지칭하는 destination segue 는 detailViewVontroller 이다.
            if let index = sender as? Int { //몇번째인지 다운캐스팅
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
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
        return bountyList.count
        //이제 임의의 숫자가 아닌 어레이의 갯수를
    }
    
    //셀은 어떻게 표현할거야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell의 타입이 UITableViewCell이다. 우리는 ListCell을 쓸것이니 캐스팅을 한다.
        //cell이 nil이 아닌경우 밑으로 코드가 넘어가고 nil인경우 else구문으로 빠진다.
        
        /*guard문
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell           else {
            return UITableViewCell()
         }
         let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
         cell.imgView.image = img
         cell.nameLable.text = nameList[indexPath.row]
         return cell
         */

        //if문으로도 가능
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell  {
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLable.text = nameList[indexPath.row]
            cell.bountyLable.text = "\(bountyList[indexPath.row])"
            return cell
        }else{
            return UITableViewCell()
        }
    }
    //셀이 클릭되었을때 어떻게 반응할거야?
    //UITableViewDelegate
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
