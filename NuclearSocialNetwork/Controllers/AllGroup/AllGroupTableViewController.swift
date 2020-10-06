//
//  AllGroupTableViewController.swift
//  NuclearSocialNetwork
//
//  Created by Hellizar on 10/1/20.
//

import UIKit

class AllGroupTableViewController: UITableViewController {
    
    let groupsArray : [GroupStruct] = [GroupStruct(name: "dell", image:                                          UIImage(named: "dell")!),
                                       GroupStruct(name: "google", image: UIImage(named: "google")!),
                                       GroupStruct(name: "hbo", image: UIImage(named: "hbo")!),
                                       GroupStruct(name: "nike", image: UIImage(named: "nike")!),
                                       GroupStruct(name: "pepsi", image: UIImage(named: "pepsi")!),
                                       GroupStruct(name: "shell", image: UIImage(named: "shell")!),
                                       GroupStruct(name: "tesla", image: UIImage(named: "tesla")!)
                                       
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.idAllGroupsCell, for: indexPath) as! AllGroupTableViewCell

        //Получаем имя для конкретной строки
        let groupName = groupsArray[indexPath.row].name
        let groupImage = groupsArray[indexPath.row].image

        
        //устанавливаем имя в надпись ячейки
        cell.myGroupsLabel.text = groupName
        cell.myGroupsImage.image = groupImage
        
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
