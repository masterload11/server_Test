//
//  PhotosViewController.swift
//  server_Test
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideViewConstraint.constant = -300
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose way of adding", message: "", preferredStyle: .alert)
        let galeryAction = UIAlertAction(title: "Gallery", style: .default) { galery in
            //open Gallery
            self.chooseImagePickerAction(source: .camera)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { camera in
            //open camera
            self.chooseImagePickerAction(source: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(galeryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func chooseImagePickerAction(source: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self //делаем imagePicker делегатом нашего вьюконтроллера
            imagePicker.allowsEditing = true //разрешить редактирование фото
            imagePicker.sourceType = source //здесь выбирается фото или галерея - это и есть наш параметр
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //что мы делаем, когда выбираем конкретное изображение в галерее или после фотки
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
//    {
//        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true //обрезаем всё, что выходит за рамки нашего супервью
//        dismiss(animated: true, completion: nil) //"отклонить"??
//    }
    
    
    
    //MARK: - SIDE VIEW
    @IBAction func sideViewButtonPressed(_ sender: UIButton) {
        //swipe right
        if sideViewConstraint.constant == -300 {
            UIView.animate(withDuration: 0.2, animations: {
                self.sideViewConstraint.constant = 0
                self.view.layoutIfNeeded()                })
        } else if sideViewConstraint.constant == 0 {        //swipe left
            UIView.animate(withDuration: 0.2, animations: {
                self.sideViewConstraint.constant = -300
                self.view.layoutIfNeeded()               })
        }
    }

    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {                      //что сделать, когда pan начался или двигается
            
            let translation = sender.translation(in: self.view).x           //КАК ДАЛЕКО? по оси x
            
            if translation > 0 {        //swipe right
                if sideViewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {                   //анимировать с продолжительностью 0.2
                        self.sideViewConstraint.constant += translation / 3               //скорость анимации вылетания
                        self.view.layoutIfNeeded()                })                  //немедленно откладывает сабвью на вью
                }
            } else {                    //swipe left
                if sideViewConstraint.constant > -300 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.sideViewConstraint.constant += translation / 3
                        self.view.layoutIfNeeded()               })
                }
            }
        } else if sender.state == .ended {                                          //что сделать, когда палец отстанет от экрана
            if sideViewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.sideViewConstraint.constant = -300
                    self.view.layoutIfNeeded()                })
                
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.sideViewConstraint.constant = 0
                    self.view.layoutIfNeeded()                })
            }
        }
    }
    

}

extension PhotosViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCollectionViewCell
    
        
        return cell
    }
    
}



















