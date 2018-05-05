//
//  ViewController.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 3..
//  Copyright © 2018년 swift. All rights reserved.
//

import UIKit
import DropDown
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dropDown:DropDown?
    var datedropDown:DropDown?
    @IBOutlet var dropBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var datedropBtn: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dropDown = DropDown()
        datedropDown = DropDown()
        
        datedropDown?.anchorView = datedropBtn
        datedropDown?.bottomOffset = CGPoint(x: 0, y: (datedropDown?.anchorView?.plainView.bounds.height)!)
        datedropDown?.dataSource = ["today","this week","this month"]
        datedropBtn.addTarget(self, action: #selector(datedropDownButton), for: .touchUpInside)
        datedropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.datedropBtn.setTitle(item, for: .normal)
        }
        dropDown?.anchorView = dropBtn
        dropDown?.bottomOffset = CGPoint(x: 0, y: (dropDown?.anchorView?.plainView.bounds.height)!)
        dropDown?.dataSource = ["All","Java","Swift","C++","JavaScript"]
        dropBtn.addTarget(self, action: #selector(dropDownButton), for: .touchUpInside)
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropBtn.setTitle(item, for: .normal)
        }
    }
    @objc func datedropDownButton(){
        datedropDown?.show()
    }
    @objc func dropDownButton(){
        dropDown?.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TrendTableViewCell
        cell.titleLbl.text = "crossoverJie / Java-Interview"
        cell.contentText.text = "👨‍🎓 Java related : basic, concurrent, algorithm"
        cell.languageLbl.text = "Swift"
        cell.porkLbl.text = "120"
        cell.starLbl.text = "293"
        cell.todayLbl.text = "399"
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        performSegue(withIdentifier: "showRepository", sender: self)
    }


}

