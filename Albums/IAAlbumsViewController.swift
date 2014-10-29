//
//  IAAlbumsViewController.swift
//  Albums
//
//  Created by Michael Stewart on 10/28/14.
//  Copyright (c) 2014 iOS in Action. All rights reserved.
//

import UIKit
import AssetsLibrary

class IAAlbumsViewController: UITableViewController {

    var albums:[ALAssetsGroup] = []
    
    func loadAlbums() {
        var library = IAAssetsLibrary.defaultInstance
        library.enumerateGroupsWithTypes(ALAssetsGroupAll, usingBlock: { (group, stop) -> Void in
//            println("in enumeration")
            if (group != nil) {
//                println("group not nil")
//                println(group.valueForProperty(ALAssetsGroupPropertyName))
                self.albums.append(group)
            } else {
//                println("group is nil")
                dispatch_async(dispatch_get_main_queue(), {
//                    println("reload data")
                    self.tableView.reloadData()
                
                })
            }
        }) { (error) -> Void in
            println("problem loading albums: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        println("view did load")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            self.loadAlbums()
            
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
//        println("numberOfSectionsInTableView")
        return 1 //this was 0, a BAD default
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
//        println("numberOfRowsInSection")
        return self.albums.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        println("GOT IN HERE")
        var CellIdentifier = "albumCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as IAAlbumTableViewCell?
        
        cell?.setFromAlbum(self.albums[indexPath.row])
        
//        if (cell == nil) {
//            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
//        }
        
//        var group = self.albums[indexPath.row]
//        cell!.textLabel.text = group.valueForProperty(ALAssetsGroupPropertyName) as String
        
//        println("about to cheese")
//        cell!.textLabel.text = "cheese"
//        println("cheese")
//        self.tableView.reloadData()
//        println("current cell textlabel text: \(cell!.textLabel.text)")

        // Configure the cell...

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as IAAlbumTableViewCell
        println("selected \(cell.albumTitleLabel.text)")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
