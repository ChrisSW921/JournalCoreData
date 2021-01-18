//
//  EntriesTableViewController.swift
//  JournalCoreData
//
//  Created by Chris Withers on 1/18/21.
//

import UIKit

class EntriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        EntryController.shared.fetchEntries()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        cell.textLabel?.text = EntryController.shared.entries[indexPath.row].title
        cell.textLabel?.textColor = .white
        return cell
    }
    



    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            CoreDataStack.context.delete(entryToDelete)
            EntryController.shared.removeEntry(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEntry" {
            guard let destination = segue.destination as? DetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let selectedEntry = EntryController.shared.entries[indexPath.row]
            destination.entry = selectedEntry
        }
    }
    

}
