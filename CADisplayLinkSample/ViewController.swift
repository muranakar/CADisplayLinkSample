//
//  ViewController.swift
//  CADisplayLinkSample
//
//  Created by 村中令 on 2022/01/16.
//

import UIKit

class ViewController: UIViewController {

    var disPlayLink = CADisplayLink()

    // MARK: - IBOutlet
    @IBOutlet weak var sec: UILabel!

    // MARK: - Variable constant
    var startTime:CFTimeInterval?
    var stopTime:CFTimeInterval?

    // MARK: - Method

    @IBAction func start(_ sender: Any) {
        startTime = CFAbsoluteTimeGetCurrent()
        createDisplayLink()
    }

    @IBAction func stop(_ sender: Any) {
        disPlayLink.invalidate()
        guard let startTime = startTime else { return }
        stopTime = CFAbsoluteTimeGetCurrent() - startTime
    }

    func createDisplayLink() {
        disPlayLink = CADisplayLink(target: self,
                                        selector: #selector(step))
        disPlayLink.add(to: .current,
                        forMode: .default)
    }

    @objc func step(displaylink: CADisplayLink) {
        guard let startTime = startTime else { return }
        stopTime = CFAbsoluteTimeGetCurrent() - startTime
        guard let stopTime = stopTime else { return }

        sec.text = "\(floor(stopTime*100)/100)"
    }
}

