//
//  ReorderTableviewViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 20/6/22.
//

import UIKit

import UIKit

struct VideoGame: Hashable {
    let id = UUID()
    let name: String
}

extension VideoGame {
    static var data = [VideoGame(name: "Mass Effect"),
                       VideoGame(name: "Mass Effect 2"),
                       VideoGame(name: "Mass Effect 3"),
                       VideoGame(name: "ME: Andromeda"),
                       VideoGame(name: "ME: Remaster")]
}

class TableDataSource: UITableViewDiffableDataSource<Int, VideoGame> {

    // 1
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 1 continued
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let fromGame = itemIdentifier(for: sourceIndexPath),
              sourceIndexPath != destinationIndexPath else { return }
        
        var snap = snapshot()
        snap.deleteItems([fromGame])
        
        if let toGame = itemIdentifier(for: destinationIndexPath) {
            let isAfter = destinationIndexPath.row > sourceIndexPath.row
            
            if isAfter {
                snap.insertItems([fromGame], afterItem: toGame)
            } else {
                snap.insertItems([fromGame], beforeItem: toGame)
            }
        } else {
            snap.appendItems([fromGame], toSection: sourceIndexPath.section)
        }
        
        apply(snap, animatingDifferences: false)
    }
}



class ReorderTableviewViewController: UIViewController {

    var videogames: [VideoGame] = VideoGame.data
       let tableView = UITableView(frame: .zero, style: .insetGrouped)
       
       lazy var datasource: TableDataSource = {
           let datasource = TableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, model) -> UITableViewCell? in
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
               cell.textLabel?.text = model.name
               return cell
           })
           
           return datasource
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
           view.addSubview(tableView)
           tableView.frame = view.bounds
           tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

           // 2
           tableView.dragDelegate = self
           tableView.dropDelegate = self
           tableView.dragInteractionEnabled = true
           
           var snapshot = datasource.snapshot()
           snapshot.appendSections([0])
           snapshot.appendItems(videogames, toSection: 0)
           datasource.applySnapshotUsingReloadData(snapshot)
       }
   }

   // 3
   extension ReorderTableviewViewController: UITableViewDragDelegate {
       func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
           guard let item = datasource.itemIdentifier(for: indexPath) else {
               return []
           }
           let itemProvider = NSItemProvider(object: item.id.uuidString as NSString)
           let dragItem = UIDragItem(itemProvider: itemProvider)
           dragItem.localObject = item

           return [dragItem]
       }
   }

   // 4
   extension ReorderTableviewViewController: UITableViewDropDelegate {
       func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
           return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
       }
       
       func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
           // If you don't use diffable data source, you'll need to reconcile your local data store here.
           // In our case, we do so in the diffable datasource subclass.
       }
   }
