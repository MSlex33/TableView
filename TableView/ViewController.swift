//
//  ViewController.swift
//  TableView
//
//  Created by Alex Popov on 09.11.2021.
//

import UIKit

class ViewController: UIViewController {

    //массив
    var dataArray: [String] = ["Anna", "Daria", "Karin"]
    
    //Таблица
    @IBOutlet weak var tavleView: UITableView!
    
    //Кнопка
    @IBAction func pushAddAction(_ sender: Any) {
    //Добавляет новый элемент
        dataArray.append("NewElement")
    //перезагрузка таблицы (обновление)
        tavleView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //назначение делегатов
        tavleView.dataSource = self
        tavleView.delegate = self
    }
}

    //расширение для класа
extension ViewController: UITableViewDelegate {
    //Функция вызова кнопки
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //Удаляем элемент
        return.delete
    }
    //Функция вызова кнопик
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    //Текст который будет появляться на этой кнопке
        return "Удалить"
        }
        
    }
    
    //Расширение для класа
extension ViewController: UITableViewDataSource {
   //Обязательная функция
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //Возвращаем массив
        return dataArray.count
    }
    //Обязательная функция
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //переиспользование ячеек памяти
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    //Что будет отображаться в таблице
        cell.textLabel?.text = dataArray[indexPath.row]
        //Возвращаем ячейку
        return cell
    }
    //Функция удаления по кнопке
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //Удаляем элемент из массива
        dataArray.remove(at: indexPath.row)
    //Удаляем ячейку из таблицы .fade - эффектом
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    
}

