//
//  HomeVC.swift
//  TikTokVideoDownloader
//
//  Created by Tipu on 31/5/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var pasteButton: UIButton!
    
    @IBOutlet weak var openTikTokButton: UIButton!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var segmentss: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        urlTextField.becomeFirstResponder()
        openTikTokButton.layer.shadowColor = UIColor.black.cgColor
        openTikTokButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        openTikTokButton.layer.shadowRadius = 2
        openTikTokButton.layer.shadowOpacity = 0.1
        openTikTokButton.layer.masksToBounds = false
        openTikTokButton.layer.shadowPath = UIBezierPath(roundedRect: openTikTokButton.bounds, cornerRadius: openTikTokButton.layer.cornerRadius).cgPath

    }
    
    @IBAction func pasteButtonTapped(_ sender: UIButton) {
        if let pasteString = UIPasteboard.general.string {
            // Use the pasteString variable, which contains the copied text
            // You can assign it to a UITextField or perform any other required operation
            urlTextField.text = pasteString
        }
    }


}

//https://www.tiktok.com/t/ZSLLDoPE1/?t=1
