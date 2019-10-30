//
//  ViewController.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit
import os.log
import IntentKit
import IntentsUI

class BeerListViewController: UIViewController {
    
    @IBOutlet weak var beerListView: UITableView!
    var vSpinner : UIView?
    var beerData = [Beers]()
    var beerSort = Bool()
    var beerArrRef = [Beers]()
    var filterArr = [String]()
    var selectedRecord = Beers()
    var searchArr = [Beers]()
    var filterOn = Bool()
    
    @IBOutlet weak var beerSearchBar: UISearchBar!
    
    @IBOutlet weak var beerSortBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterOn = false
        beerListView.register(UINib(nibName: "BeerListViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "BeerListViewCellTableViewCell")
        setupNavigationBar()
        INInteraction.delete(with: "Take my order") { err in
            print(err?.localizedDescription)
        }
        self.addTakeOrderSiri()
        
//        self.getMeBeer()
    }
    
    func addSelectBeerSiriIntent(){
       let intent = SelectBeerIntent()
        intent.suggestedInvocationPhrase = "Take my order"
        intent.beerName = "beerName"
        intent.amount = 0
       let interaction = INInteraction(intent: intent, response: nil)
       
       interaction.donate { (error) in
           if error != nil {
               if let error = error as NSError? {
                   print("Interaction donation failed: \(error.description)")
               } else {
                   print("Successfully donated interaction")
               }
           }
       }
    }
    
    func addTakeOrderSiri(){
        let intent = SelectBeerIntent()
        intent.beerName = "beerName"
        intent.amount = 0
        guard let shortcut = INShortcut(intent: intent) else {
            return
        }
        let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
    
    func getMeBeer() {
        let activity = NSUserActivity.orderBeerActivity
        let shortcut = INShortcut(userActivity: activity)
        let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        viewController.delegate = self
        present(viewController,animated: true,completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //API call to get the details
        if beerData.count == 0{
            fetchAllBeers()
        }
        // Applying filter on the beer list
        if filterArr.count > 0{
            beerData = beerData.filter { filterArr.contains($0.style!) }
            beerListView.reloadData()
            filterArr.removeAll()
        }
    }
    
    // Setup for filter button
    func setupNavigationBar(){
        let filterBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "FilterBtn"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(navigateToFilterScreen))
        self.navigationItem.rightBarButtonItem = filterBtn
    }
    
    
    //Setup  for clear filter button to remove filters
    func setupClearFilter()  {
        let filterBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "ClearFilter"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(navigateToFilterScreen))
        self.navigationItem.rightBarButtonItem = filterBtn
    }
    
    @objc func navigateToFilterScreen(){
//        if filterOn{
//            filterOn = false
//            filterArr.removeAll()
//            beerSearchBar.text=""
//            beerData = beerArrRef
//            beerListView.reloadData()
//            setupNavigationBar()
//        } else{
//            for item in beerData{
//                if let style = item.style{
//                    filterArr.append(style)
//                }
//            }
//            filterArr = Array(Set(filterArr))
//            self .performSegue(withIdentifier: "showFilters", sender: self)
//        }
        
        self.getMeBeer()
    }
    
    // API :getBeerDetails
    open func fetchAllBeers(){
        vSpinner = showSpinner(onView: self.view)
        ServerManager.sharedInstance.getAllBeers() { [unowned self](details, error) in
            
            if let error = error {
                self.removeSpinner(spinner: self.vSpinner)
                self.vSpinner = nil
                self.showErrorAlertWithTitle("Error", message: error.details.message)
            }
            else {
                if let details = details as? [Beers] {
                    self.updateUIwithDetails(details)
                    self.removeSpinner(spinner: self.vSpinner)
                    self.vSpinner = nil
                    
                }
            }
        }
    }
    
    
    
    //Update table on response of API
    func updateUIwithDetails(_ details:[BeerData]){
        beerData.removeAll()
        beerData = details
        beerArrRef = beerData // Master ref of data
        self.beerListView.reloadData()
    }
    
    func compareNames(s1:String, s2:String) -> Bool {
        return s1 < s2
    }
    
    //Sort Beer list on ABV
    @IBAction func ABVSortBtnAction(_ sender: Any) {
        beerSort = !beerSort
        if beerSort {
            beerData = beerData.sorted(by: {Double($0.abv!) ?? 0 < Double($1.abv!) ?? 0})
            beerSortBtn.setImage(#imageLiteral(resourceName: "Descending"), for: .normal)
        } else {
            beerData = beerData.sorted(by: {Double($0.abv!) ?? 0 > Double($1.abv!) ?? 0})
             beerSortBtn.setImage(#imageLiteral(resourceName: "Ascending"), for: .normal)
        }
     beerListView.reloadData()
    }
}



extension BeerListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return beerData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListViewCellTableViewCell", for: indexPath) as! BeerListViewCellTableViewCell
        
        cell.layer.cornerRadius = 10.0
        cell.beerData = beerData[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecord = beerData[indexPath.section]
        beerSearchBar.text = nil
        self.performSegue(withIdentifier: "showBeerDetail", sender: self)
    }
    
}

//Wait cursor setup
extension BeerListViewController{
    func showSpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    func removeSpinner(spinner:UIView?) {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
        }
    }
}

//Search Bar delegate functions
extension BeerListViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            beerData = searchArr
            self.beerListView.reloadData()
        } else if searchText.count > 0{
            beerData = searchArr.filter { ($0.name?.lowercased().contains(searchText.lowercased()))! }
            self.beerListView.reloadData()
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.beerListView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchArr = beerData
    }
    
    
}


extension BeerListViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilters"{
            let controller = segue.destination as! FilterTableViewController
            controller.filterArray = filterArr
        } else if segue.identifier == "showBeerDetail"{
            if let nextViewController = segue.destination as? BeerDetailViewController {
                nextViewController.beerDetail = selectedRecord
            }
        }
    }
    
    
    @IBAction func unwindFromFilterScreen(_ sender: UIStoryboardSegue){
        setupClearFilter()
        filterOn = true
    }
}


extension BeerListViewController{

    override func restoreUserActivityState(_ activity: NSUserActivity) {
        os_log("TK421: %{public}s", "\(#function)")
        super.restoreUserActivityState(activity)
        
        if activity.activityType == NSUserActivity.orderBeerActivityType {
            print("Done")
        }
    }
    
}

extension BeerListViewController: INUIAddVoiceShortcutButtonDelegate {
    
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension BeerListViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        if let error = error as NSError? {
            os_log("Error adding voice shortcut: %@", log: OSLog.default, type: .error, error)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        dismiss(animated: true, completion: nil)
    }
}

extension BeerListViewController: INUIEditVoiceShortcutViewControllerDelegate {
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController,
                                         didUpdate voiceShortcut: INVoiceShortcut?,
                                         error: Error?) {
        if let error = error as NSError? {
            os_log("Error adding voice shortcut: %@", log: OSLog.default, type: .error, error)
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController,
                                         didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
