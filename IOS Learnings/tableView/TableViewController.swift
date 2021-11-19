//
//  TableViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 19/11/21.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if (indexPath.row == 0){
            let cell = UITableViewCell()
            cell.textLabel?.text = "An image,label, and switch"
            let mySwitch = UISwitch()
            cell.accessoryView = mySwitch
          
            cell.imageView?.image = UIImage(named: "pic")
            circularImage(cell: cell)

            
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
     
            return cell
        }else if(indexPath.row == 1){
            
    
            let cell = UITableViewCell()
            cell.textLabel?.text = "An image,label, and stepper"
            let stepper = UIStepper()
            //stepper.wraps = true
            cell.accessoryView = stepper
            stepper.wraps = true
            //stepper.layer.borderColor = UIColor.blue.cgColor
            //stepper.layer.borderWidth = 1
            
            cell.imageView?.image = UIImage(named: "pic")
            circularImage(cell: cell)
           

            
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            
            return cell
            
        }else if(indexPath.row == 2){
            let cell = UITableViewCell (style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
            cell.textLabel?.text = "value 1 style"
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 24))
            label.center = CGPoint(x: 0, y: 0)
            label.textAlignment = .center
            label.textColor = UIColor.gray
            label.text = "the value"
            
            cell.accessoryView = label
            // self.view.addSubview(label)
            
          
            cell.imageView?.image = UIImage(named: "pic")
            circularImage(cell: cell)

            
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            
            return cell
            
        }else if (indexPath.row == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
           // cell.detailTextLabel?.text = "value2 style"
            cell.textLabel?.text = "value2 style"
            cell.textLabel?.textColor = UIColor.tintColor
           // cell.textLabel?.textAlignment =
            //cell.detailTextLabel?.text
            cell.imageView?.image = UIImage(named: "pic")
            circularImage(cell: cell)
            cell.imageView?.isHidden = true
            
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 235, height: 50))
            //label.center = CGPoint(x: 0, y: 0)
            
            label.textAlignment = .left
            label.numberOfLines = 0
            label.textColor = UIColor.black
            label.text = "can't use an image with this"
            
            cell.accessoryView = label
            
            
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            return cell
            
        }else if(indexPath.row == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = "This Style"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.tintColor
            
            
            //cell.textLabel?.text = "This style looks a bit antiquated"
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 265, height: 20))
            //label.center = CGPoint(x: 0, y: 0)
            
            label.textAlignment = .left
            label.numberOfLines = 0
            label.textColor = UIColor.black
            label.text = "looks a bit antiquated"
            cell.accessoryView = label
            
            
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            return cell
            
        }else if(indexPath.row == 5){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            //let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
            cell.textLabel?.text = "The most useful style is the subtitle style."
            cell.detailTextLabel?.text = "This is the subtitle.This cell has a Button"
            cell.imageView?.image = UIImage(named: "pic")
            circularImage(cell: cell)
            

            
            let button : UIButton = UIButton(type:UIButton.ButtonType.custom) as UIButton
            button.frame = CGRect(origin: CGPoint(x: 100,y :10), size: CGSize(width: 60, height: 24))
            let cellHeight: CGFloat = 44.0
            button.center = CGPoint(x: view.bounds.width / (9/8), y: cellHeight / 2.0)


            button.setTitleColor(.tintColor, for: .normal)
            //button.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
            button.setTitle("Button", for: UIControl.State.normal)
            //cell.addSubview(button)
            cell.accessoryView = button
            
            
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            
            return cell
           
            
        }else if(indexPath.row == 6){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = "Segment Control"
            cell.detailTextLabel?.text = "This quite a big accessory view"
            cell.imageView?.image = UIImage(named: "pic")
            circularImage(cell: cell)
            

            
            let items = ["Show", "Medium", "Fast"]
            let filtersSegment = UISegmentedControl(items: items)
            filtersSegment.frame = CGRect.init(x: 0, y: 0, width: 200, height: 24)
            filtersSegment.selectedSegmentIndex = 1
            filtersSegment.tintColor = UIColor.black
            //filtersSegment.addTarget(self, action: #selector(self.filterApply), for: UIControlEvents.valueChanged)
            //cell.addSubview(filtersSegment)
            cell.accessoryView = filtersSegment

            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            //cell.heightAnchor == 100
            return cell
        }
        
        
      
           return UITableViewCell()
    }
   
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 7
      }
    
    
    func circularImage(cell:UITableViewCell){
        let itemSize = CGSize.init(width: 40, height: 40) // your custom size
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        cell.imageView?.image!.draw(in: imageRect)
        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext()
        cell.imageView?.layer.cornerRadius = (itemSize.width) / 2
        cell.imageView?.clipsToBounds = true

    }
    

    

}
