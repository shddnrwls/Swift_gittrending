//
//  ViewController.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 3..
//  Copyright © 2018년 swift. All rights reserved.
//

import UIKit
import DropDown
import Kanna
import Alamofire
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dropDown:DropDown?
    var datedropDown:DropDown?
    var namearr : Array<String> = Array<String>()
    var constantarr : Array<String> = Array<String>()
    var stararr : Array<String> = Array<String>()
    var todaystararr : Array<String> = Array<String>()
    
    

    @IBOutlet var dropBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var datedropBtn: UIButton!
    
    let mainURL = "https://github.com/trending/swift"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getParsing()
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TrendTableViewCell
        cell.titleLbl.text = namearr[indexPath.row]
        cell.contentText.text = constantarr[indexPath.row]
        cell.languageLbl.text = "Swift"
        cell.porkLbl.text = "120"
        cell.starLbl.text = stararr[indexPath.row]
        cell.todayLbl.text = todaystararr[indexPath.row]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namearr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        performSegue(withIdentifier: "showRepository", sender: self)
    }
    
    
    
    func getParsing(){
        guard let main = URL(string: mainURL) else {
            print("Error: \(mainURL) doesn't seem to be a valid URL")
            return
        }
        do {
            let lolMain = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: lolMain, encoding: .utf8)
            for product in doc.xpath("//div[@class='explore-content']") {
                if let olTag = product.at_xpath("ol"){
                    for list in olTag.xpath("li"){
                        if let pr = list.at_xpath("div"){
                            if let se = pr.text, se.contains("/"){
                                let tri = se.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                namearr.append(tri)
                            }
                            
                        }
                        if let con = list.at_xpath("div[@class = 'py-1']"){
                            if let conn = con.at_xpath("p"){
                                let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                constantarr.append(connn!)
                            }
                            
                        }
                        if let star = list.at_xpath("div[@class = 'f6 text-gray mt-2']"){
                            if let star2 = star.at_xpath("a"){
                                if let star3 = star2.text , star3.contains("\n"){
                                    let star4 = star3.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                    stararr.append(star4)
                                }
                            }
                            if let todaystar = star.at_xpath("span[@class = 'd-inline-block float-sm-right']"){
                                if let todaystar2 = todaystar.text , todaystar2.contains("\n"){
                                    let todaystar3 = todaystar2.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                    todaystararr.append(todaystar3)
                                }
                            }
                        }
                    }
                }
                
            }
        }catch let error {
            print("Error:\(error)")
        }
  
    
    }
}

