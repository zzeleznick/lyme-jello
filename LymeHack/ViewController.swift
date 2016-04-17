//
//  ViewController.swift
//  LymeHack
//
//  Created by Zach Zeleznick on 4/16/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController {
    
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func activeTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ReactionTask, taskRunUUID: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0], isDirectory: true)
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
}

extension ViewController : ORKTaskViewControllerDelegate {
    
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        // Handle results with taskViewController.result
        print(taskViewController.result)
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
