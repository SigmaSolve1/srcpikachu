//
//  TablewDataVC.swift
//  DemoApp
//
//  Created by Deval on 03/08/17.
//  Copyright © 2017 Prudent. All rights reserved.
//

import UIKit
import RealmSwift

private let CellIdentifier =  "TableDataCell"

class TablewDataVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var selectedCell = [IndexPath]()
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var PopView: UIView!
    
    @IBOutlet weak var favbtn: UIButton!
  
    var arrMyModel = [MyModel]()
    var arrayData = [String]()
    

    var arrProductList: Results<Product>!
    
    var strUrl = ""
    var strDataUrlSend = String()
    
    var strFavName = Int()
    var strFavId = Int()
    
    var sitterArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                PopView.isHidden = true


                let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
                swipeRight.direction = UISwipeGestureRecognizerDirection.right
                self.view.addGestureRecognizer(swipeRight)
        
                let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
                swipeLeft.direction = UISwipeGestureRecognizerDirection.left
                self.view.addGestureRecognizer(swipeLeft)
    
                self.PdfDownloadWebservice()

    }
    

    
    @IBAction func ExitNow(sender: AnyObject) {
        exit(0)
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:

                print("Swiped right")

            case UISwipeGestureRecognizerDirection.down:
                
                print("Swiped down")
                
            case UISwipeGestureRecognizerDirection.left:
                
                print("Swiped left")
                
                let ObjMultiplePinVC = Constants.mainStoryboard.instantiateViewController(withIdentifier: "MultiplePinVC") as! MultiplePinVC
                self.navigationController?.pushViewController(ObjMultiplePinVC, animated: false)
                
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                
            default:
                break
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    
    }
    
    // MARK: - Action

    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK: - WebService
    func PdfDownloadWebservice()
    {
        AllService().PdfDownload( success: { (response) in
            
            print(response.description)
            
            if let arrTable = response.dictionary
            {
                print("model : \(arrTable)")
                
                var arrTemp : [MyModel] = []
            
                for dict in arrTable {
                    
                    let model = ModelManager.sharedInstance.getMyModel(dict.value.dictionaryObject! as NSDictionary)
                    arrTemp.append(model)
                
                }
                
                self.arrMyModel = arrTemp
                self.tableview.reloadData()
               
            }
            
        })
        { (error) in
            print(error as Any)
        }
    }
   
    // MARK: - Tableview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return self.arrMyModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell:TableDataCell = self.tableview.dequeueReusableCell(withIdentifier: CellIdentifier) as! TableDataCell!
        
        let arrdata = self.arrMyModel[indexPath.item]
   
        cell.lblName.text = arrdata.name
        cell.lblcountry.text = arrdata.country
        cell.lblcity.text = arrdata.city

        if cell.isSelected
        {
            cell.isSelected = false
            if cell.accessoryType == UITableViewCellAccessoryType.none
            {

                cell.ImageFav.image = UIImage(named: "like")
                cell.backgroundColor = UIColor.green
            }
            else
            {

                cell.ImageFav.image = UIImage(named: "Unlike")

            }
        }
        
        
        
        return cell
    }


    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        PopView.isHidden = false
        
        strFavId = indexPath.row
    

        
        let DataAirport = self.arrMyModel[indexPath.item]
        let str = DataAirport.name
        
        print("str:\(String(describing: str))")
    
        strUrl = str!
        
        PopView.isHidden = false
        

        let cell = tableView.cellForRow(at: indexPath) as! TableDataCell

        cell.isSelected = false
        if cell.accessoryType == UITableViewCellAccessoryType.none
        {

            selectedCell.append(indexPath)
            cell.ImageFav.image = UIImage(named: "like")
            cell.backgroundColor = UIColor.green
        

        }
        else
        {

            selectedCell.removeAll()
            cell.ImageFav.image = UIImage(named: "Unlike")

        }
        

    }
    

    func writeWord(word: String){
        strDataUrlSend = strUrl
    }
    
    @IBAction func button(sender: AnyObject) {
       
        writeWord(word: strDataUrlSend)
        
        let ObjWebViewVC = Constants.mainStoryboard.instantiateViewController(withIdentifier: "WebViewVC") as! WebViewVC
        ObjWebViewVC.strDataUrlSend = self.strDataUrlSend
        self.navigationController?.pushViewController(ObjWebViewVC, animated: false)
        
    }
    
    
    func btnRequestQuoteClicked(_ sender: UIButton)
    {
        let intTag = sender.tag
        let indexPath = IndexPath(row: intTag, section: 0)
        
        let selectProductModel = self.arrMyModel[indexPath.item]
        
        let addProduct = Product()
        
        addProduct.product_id = selectProductModel.name!

        
        let realm = try! Realm()
        
        let productID = "product_id = '\(selectProductModel.name!)'"

    
        
        let repeatedItem = realm.objects(Product.self).filter(productID)
        print("repeatedItem : \(repeatedItem)")
        
        
        let item:Int = strFavId
        
        if repeatedItem.count == item
        {
            try! realm.write {
                realm.add(addProduct)
            }
            
            let realm = try! Realm()
            arrProductList  = realm.objects(Product.self)
        
            let cartNo : Int = arrProductList.count
            print("Cart no : \(cartNo)")
            
            let strCartNo : String = String(cartNo)
            
//          lblCartNo.text = strCartNobt
            
            self.view.makeToast(message: "Save this airport to favorite")
            

        
            let cell = tableview.cellForRow(at: indexPath) as! TableDataCell

            cell.isSelected = false
            if cell.accessoryType == UITableViewCellAccessoryType.none
            {
              
                selectedCell.append(indexPath)
                cell.ImageFav.image = UIImage(named: "like")
                cell.backgroundColor = UIColor.green
                
                
            }
            else
            {
       
                selectedCell.removeAll()
                cell.ImageFav.image = UIImage(named: "Unlike")
                
            }

            
            return
        }
            
        else
        {
            self.view.makeToast(message: "Already in airport to favorite")
            return
        }
    }


    func writeWord1(word: Int){
        
        strFavName = strFavId
    
    }
    
    @IBAction func btnSaveFavBtnClk(sender: AnyObject) {
        
        self.btnRequestQuoteClicked(sender as! UIButton)
        writeWord1(word: strFavName)
        print("strDataUrlSend:\(strFavName)")
    
    }

    @IBAction func OKBtnClk(_ sender: Any)
    {
        
        PopView.isHidden = true
        
    }


   
}
