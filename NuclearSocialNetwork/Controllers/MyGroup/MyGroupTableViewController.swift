//
//  MyGroupTableViewController.swift
//  NuclearSocialNetwork
//
//  Created by Hellizar on 10/1/20.
//

import UIKit

class MyGroupTableViewController: UITableViewController {

    var groupsArray : [GroupStruct] = [GroupStruct(name: "Apple", image: UIImage(named: "apple")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.idMyGroupsCell, for: indexPath) as! MyGroupTableViewCell

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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // если нажали "удалить"
        if editingStyle == .delete {
            // удаляем группу из массива
            groupsArray.remove(at: indexPath.row)
            // и удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue){
        
        //рабочий вариант , но с сигвеем
        // проверяем идентификатор перехода
        if segue.identifier == K.Segue.idUnwindAddGroup {
            // получаем ссылку на контроллер с которого осуществлен переход
            guard let allGroup = segue.source as? AllGroupTableViewController else {return }
            //получаем индекс выделенной ячейки
            if let indexPath = allGroup.tableView.indexPathForSelectedRow {
                // получаем группу по индексу
                let group = allGroup.groupsArray[indexPath.row]
                //проверяем, что такой группу нет в списке
                if !groupsArray.contains(group){
                    // добавляем группу в список выбранных
                    groupsArray.append(group)
                    // теперь обновляем таблицу
                    tableView.reloadData()
                    
                    //   это без сегвея , но я не знаю как тут получить indexPath
                    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    //        guard let secondViewController = storyboard.instantiateViewController(identifier: K.Controller.idAllGroupTVC) as? AllGroupTableViewController else { return }
                    //
                    //        if let indexPath = tableView.indexPathForSelectedRow {
                    //            // получаем группу по индексу
                    //            let group = groupsArray[indexPath.row]
                    //            //проверяем, что такой группу нет в списке
                    //            if !groupsArray.contains(group){
                    //                // добавляем группу в список выбранных
                    //                groupsArray.append(group)
                    //                // теперь обновляем таблицу
                    //                tableView.reloadData()
                    //            }
                    //        }
                    //        show(secondViewController, sender: nil)
                }
            }
        }
    }
}
