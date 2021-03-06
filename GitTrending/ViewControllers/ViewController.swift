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
var url = "https://github.com"
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dropDown:DropDown?
    var datedropDown:DropDown?
    var namearr : Array<String> = Array<String>()
    var constantarr : Array<String> = Array<String>()
    var stararr : Array<String> = Array<String>()
    var todaystararr : Array<String> = Array<String>()
    var arr : Array<Array<String>> = Array<Array<String>>()
    @IBOutlet var navView: UIView!

    @IBOutlet var dropBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var datedropBtn: UIButton!
    
    var mainURL = "https://github.com/trending"
    override func viewDidLoad() {
//        ParsingManager.instance.allTrending()

        print("asd")
        super.viewDidLoad()
        parsing()
//        getParsing()
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
            if item == "Swift"{
                self.dropBtn.setTitle(item, for: .normal)
                self.navView.backgroundColor = UIColor.brown
                self.mainURL = "\(self.mainURL)/swift"
                self.removeArray()
                self.getParsing()
                self.mainURL = "https://github.com/trending"
                
            }
            else if item == "All"{
                self.dropBtn.setTitle(item, for: .normal)
                self.navView.backgroundColor = UIColor.black
                self.mainURL = "\(self.mainURL)"
                self.removeArray()
                self.getParsing()
                self.mainURL = "https://github.com/trending"
            }
            else if item == "Java"{
                self.dropBtn.setTitle(item, for: .normal)
                self.navView.backgroundColor = UIColor.red
                self.mainURL = "\(self.mainURL)/java"
                self.removeArray()
                self.getParsing()
                self.mainURL = "https://github.com/trending"
            }
            else if item == "C++"{
                self.dropBtn.setTitle(item, for: .normal)
                self.navView.backgroundColor = UIColor.lightGray
                self.mainURL = "\(self.mainURL)/c++"
                self.removeArray()
                self.getParsing()
                self.mainURL = "https://github.com/trending"
                
            }
            else{
                self.dropBtn.setTitle(item, for: .normal)
                self.navView.backgroundColor = UIColor.black
                self.mainURL = "\(self.mainURL)"
                self.mainURL = "https://github.com/trending"
            }
            
            
        }
    }
    @objc func datedropDownButton(){
        datedropDown?.show()
    }
    @objc func dropDownButton(){
        dropDown?.show()
    }
    func parsing(){
        DispatchQueue.global(qos: .background).async {
            self.arr = ParsingManager.instance.all() as! Array<Array<String>>
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TrendTableViewCell
//        cell.titleLbl.text = namearr[indexPath.row]
//        cell.contentText.text = constantarr[indexPath.row]
        cell.languageLbl.text = dropDown?.selectedItem
//        cell.porkLbl.text = "120"
//        cell.starLbl.text = stararr[indexPath.row]
//        cell.todayLbl.text = todaystararr[indexPath.row]
        cell.titleLbl.text = arr[0][indexPath.row]
        cell.contentText.text = arr[1][indexPath.row]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        url = "\(url)/\(namearr[indexPath.row])"
        url = url.replacingOccurrences(of: " ", with:"")
        print(url)
        performSegue(withIdentifier: "showRepository", sender: mainURL)
        
    }
    
    func removeArray(){
        namearr.removeAll()
        stararr.removeAll()
        todaystararr.removeAll()
        constantarr.removeAll()
    }
    
    func getParsing(){
        
        
            guard let main = URL(string: self.mainURL) else {
                print("Error: \(self.mainURL) doesn't seem to be a valid URL")
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
                                self.namearr.append(tri)
                                
                            }
                            
                        }
                        if let con = list.at_xpath("div[@class = 'py-1']"){
                            if let conn = con.at_xpath("p"){
                                let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                self.constantarr.append(connn!)
                            }
                            
                        }
                        if let star = list.at_xpath("div[@class = 'f6 text-gray mt-2']"){
                            if let star2 = star.at_xpath("a"){
                                if let star3 = star2.text , star3.contains("\n"){
                                    let star4 = star3.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                    self.stararr.append(star4)
                                }
                            }
                            if let todaystar = star.at_xpath("span[@class = 'd-inline-block float-sm-right']"){
                                if let todaystar2 = todaystar.text , todaystar2.contains("\n"){
                                    let todaystar3 = todaystar2.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                    self.todaystararr.append(todaystar3)
                                    
                                }
                            }
                        }
                    }
                }
                tableView.reloadData()
            }
            
        }catch let error {
            print("Error:\(error)")
        }
    }
}

