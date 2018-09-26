//
//  ViewController.swift
//  TMOB
//
//  Created by Ahmet AYKAÇ on 26.09.2018.
//  Copyright © 2018 Ahmet AYKAÇ. All rights reserved.
//

import UIKit

let myUrl = "https://jsonplaceholder.typicode.com/photos"
let url = URL(string: myUrl)!
let jsonData = try! Data(contentsOf: url)
var jsonDecoder = JSONDecoder()
var titles = [String]()
var photoUrls = [String]()

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  photos = try? jsonDecoder.decode([Photo].self, from: jsonData)
        if let mod = photos  {
            for m in mod{
                titles.append(m.title)
                photoUrls.append(m.thumbnailUrl)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = titles[indexPath.row]
        if let url = NSURL(string: (photoUrls[indexPath.row])){
            if let data = NSData(contentsOf: url as URL){
                cell.imageView?.image = UIImage(data: data as Data)
            }
        }
        
        return cell
    }
    
    
}
