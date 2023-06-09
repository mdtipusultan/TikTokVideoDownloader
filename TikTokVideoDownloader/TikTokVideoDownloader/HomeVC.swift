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
            
            // Call the method to download the TikTok video
                  downloadTikTokVideo(from: pasteString)
        }
    }
    
    func downloadTikTokVideo(from videoURL: String) {
        guard let url = URL(string: videoURL) else {
            print("Invalid video URL")
            return
        }
        
        // Create a download task using URLSession
        let downloadTask = URLSession.shared.downloadTask(with: url) { (location, response, error) in
            guard let location = location, error == nil else {
                print("Failed to download the video:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            // Get the temporary directory URL to save the video
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let destinationURL = documentsURL.appendingPathComponent("downloadedVideo.mp4")
            
            do {
                // Move the downloaded video to the destination URL
                try FileManager.default.moveItem(at: location, to: destinationURL)
                print("Video downloaded and saved to:", destinationURL)
                
                // Perform any additional tasks with the downloaded video, such as displaying it to the user or saving it to the device's photo library
            } catch {
                print("Failed to save the downloaded video:", error.localizedDescription)
            }
        }
        
        // Start the download task
        downloadTask.resume()
    }
    @IBAction func openTikTokButtonTapped(_ sender: UIButton) {
        openTikTokApp()
    }
    func openTikTokApp() {
        // Check if the TikTok app is installed
        if let tikTokURL = URL(string: "snssdk1128://") {
            if UIApplication.shared.canOpenURL(tikTokURL) {
                // Open the TikTok app
                UIApplication.shared.open(tikTokURL, options: [:], completionHandler: nil)
            } else {
                // TikTok app is not installed, handle the situation accordingly
                print("TikTok app is not installed on the device.")
            }
        }
    }

}

//https://www.tiktok.com/t/ZSLLDoPE1/?t=1
