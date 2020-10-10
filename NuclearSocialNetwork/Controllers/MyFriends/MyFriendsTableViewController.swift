//
//  MyFriendsTableViewController.swift
//  NuclearSocialNetwork
//
//  Created by Hellizar on 10/1/20.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {
    
    // моя структура с "друзьями"
    var userArray : [UserStruct] = [UserStruct(name: "Shrek", image:                                       UIImage(named: "shrek.jpg")!, mainImage: UIImage(named: "shrekFull.jpg")!),
                                    UserStruct(name: "Brad", image:   UIImage(named: "brad.jpg")!, mainImage: UIImage(named: "bradFull.jpg")!),
                                    UserStruct(name: "Elon", image:           UIImage(named: "elon.jpg")!, mainImage: UIImage(named: "elonFull.jpg")!),
                                    UserStruct(name: "Elvis", image:           UIImage(named: "elvis.jpg")!, mainImage: UIImage(named: "elvisFull.jpg")!),
                                    UserStruct(name: "Jim", image:           UIImage(named: "jim.jpg")!, mainImage: UIImage(named: "jimFull.jpg")!),
                                    UserStruct(name: "Kyle", image:           UIImage(named: "kyle.jpg")!, mainImage: UIImage(named: "kyleFull.jpg")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.idMyFriendsCell , for: indexPath) as! MyFriendsTableViewCell

        //Получаем имя для конкретной строки
        let friendName = userArray[indexPath.row].name
        let friendImage = userArray[indexPath.row].image

        
        //устанавливаем имя в надпись ячейки
        cell.myFriendsLabel.text = friendName
        cell.myFriendsImage.image = friendImage
        return cell
    }
    // триггер если выбираем cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //создаем проперти в которой находится storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //если вью, на которое переходим имеет нужный идентификатор...
        guard let secondViewController = storyboard.instantiateViewController(identifier: K.Controller.idAllFriendsCVC) as?  FriendsImagesCollectionViewController  else { return }
        // номер ячейки будет номером структуры в массиве , запишем в проперти friend
        let friend = userArray[indexPath.row]
        // передаём нужную картинку
        secondViewController.mainImage = friend.mainImage
        // показываем контроллер
        show(secondViewController, sender: nil)
    }
    
    @IBAction func logButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
}
    
}
    
    
    
    

