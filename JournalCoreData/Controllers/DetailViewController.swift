//
//  DetailViewController.swift
//  JournalCoreData
//
//  Created by Chris Withers on 1/18/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextArea: UITextView!
    
    var entry: Entry? {
        didSet{
            loadViewIfNeeded()
            showViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func clearAllButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextArea.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let text = bodyTextArea.text, !text.isEmpty else { return }
        
        if let selectedEntry = entry {
            EntryController.shared.editEntry(entry: selectedEntry, title: title, text: text)
        }else {
            EntryController.shared.addEntry(withTitle: title, text: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func showViews(){
        guard let selectedEntry = entry else { return }
        titleTextField.text = selectedEntry.title
        bodyTextArea.text = selectedEntry.text
    }
}
