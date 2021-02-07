//
//  ViewController.swift
//  GiphyGallery
//
//  Created by Rudra on 06/02/21.
//

import UIKit
import SwiftyGiphy
import Kingfisher

class ViewController: UIViewController {
    
    let defaultGifUrl = URL(string: "https://media.giphy.com/media/X7eWjlI9UN0LtOCrNp/giphy.gif")
    
    @IBOutlet weak var gifImage: UIImageView!
        
    @IBAction func showGiphyLib(_ sender: UIBarButtonItem) {
        loadGiphyLib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGiphyLib()
        
        self.gifImage.kf.setImage(with: defaultGifUrl)
    }

    func loadGiphyLib() {
        let giphyLib = SwiftyGiphyViewController()
        
        giphyLib.delegate = self
        
        present(giphyLib, animated: true, completion: nil)
    }
    
}

extension ViewController: SwiftyGiphyViewControllerDelegate{
    
    func giphyControllerDidSelectGif(controller: SwiftyGiphyViewController, item: GiphyItem){
        print(item)
        let url = item.originalImage?.url ?? defaultGifUrl
                
        controller.dismiss(animated: true) {
            self.gifImage.kf.setImage(with: url)
        }
    }
    
    func giphyControllerDidCancel(controller: SwiftyGiphyViewController) {
        //...
    }
    
}
