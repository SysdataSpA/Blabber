//
//  SDSwiftViewController.swift
//  Blabber_Example
//
//  Created by Francesco Ceravolo on 19/12/18.
//  Copyright © 2018 francescoceravolo. All rights reserved.
//

import UIKit
import Blabber

class SDSwiftViewController: UIViewController {
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.selectedSegmentIndex = UISegmentedControl.noSegment

        SDLogger.shared().setup()
//        Log.setup()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
//            SDLogger.shared().genericLogLevel = SDLogLevel.verbose
            Logger.setup(settings: LogSettings(.verbose))
            break;
        case 1:
//            SDLogger.shared().genericLogLevel = SDLogLevel.info
            Logger.setup(settings: LogSettings(.info))
            break;
        case 2:
//            SDLogger.shared().genericLogLevel = SDLogLevel.warning
            Logger.setup(settings: LogSettings(.warning))
            break;
        case 3:
//            SDLogger.shared().genericLogLevel = SDLogLevel.error
            Logger.setup(settings: LogSettings(.error))
            break;
        default:
            break;
        }
        segmentControl.isUserInteractionEnabled = false
        segmentControl.alpha = 0.3
    }
    
    @IBAction func logVerbose(_ sender: UIButton) {
        Log.verbose?.message("This is a verbose message")
    }
    
    @IBAction func logInfo(_ sender: UIButton) {
        Log.info?.message("This is an info message")
    }
    
    @IBAction func logWarning(_ sender: UIButton) {
        Log.warning?.message("This is a warning message")
    }
    
    @IBAction func logError(_ sender: UIButton) {
        Log.error?.message("This is an error message")
    }
    
}
