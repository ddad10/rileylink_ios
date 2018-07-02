//
//  RileyLinkManagerSetupViewController.swift
//  Loop
//
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import UIKit
import LoopKit
import LoopKitUI
import RileyLinkKit
import RileyLinkBLEKit

open class RileyLinkManagerSetupViewController: UINavigationController, PumpManagerSetupViewController, UINavigationControllerDelegate {

    open var maxBasalRateUnitsPerHour: Double?

    open var maxBolusUnits: Double?

    open var basalSchedule: BasalRateSchedule?

    open weak var setupDelegate: PumpManagerSetupViewControllerDelegate?

    open private(set) var rileyLinkPumpManager: RileyLinkPumpManager?
    
    open var rileyLinkManager: RileyLinkDeviceManager?

    open override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }

    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let viewControllers = navigationController.viewControllers
        let count = navigationController.viewControllers.count

        if count >= 2, let setupViewController = viewControllers[count - 2] as? RileyLinkSetupTableViewController {
            rileyLinkPumpManager = setupViewController.rileyLinkPumpManager
        }
    }
}
