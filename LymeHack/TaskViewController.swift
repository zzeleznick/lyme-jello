//
//  TaskViewController.swift
//  LymeHack
//
//  Created by Zach Zeleznick on 4/16/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit
import ResearchKit

class TaskViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // MARK - Create a Step
        let myStep = ORKInstructionStep(identifier: "intro")
        myStep.title = "Welcome to LymeHack"
        
        // MARK - Create a Task
        let task = ORKOrderedTask(identifier: "task", steps: [myStep])
        
        // MARK - Present Controller
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }

    func taskViewController(taskViewController: ORKTaskViewController,
        didFinishWithReason reason: ORKTaskViewControllerFinishReason,
        error: NSError?) {
            let taskResult = taskViewController.result
            print(taskResult)
            // You could do something with the result here.
            
            // Then, dismiss the task view controller.
            dismissViewControllerAnimated(true, completion: nil)
    }


}

