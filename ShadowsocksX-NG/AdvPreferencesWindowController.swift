//
//  AdvPreferencesWindowController.swift
//  ShadowsocksX-NG
//
//  Created by 邱宇舟 on 16/6/6.
//  Copyright © 2016年 qiuyuzhou. All rights reserved.
//

import Cocoa

class AdvPreferencesWindowController: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.delegate = self
    }
    
    //------------------------------------------------------------
    // NSWindowDelegate
    func windowWillClose(_ notification: Notification) {
        NotificationCenter.default
            .post(name: Notification.Name(rawValue: NOTIFY_ADV_CONF_CHANGED), object: nil)
    }

    @IBAction func reset(_ sender: NSButton) {
        let defaultSettings = UserDefaults.defaultSetting()
        let gfwListURL = defaultSettings[GFW_LIST_URL] as! String
        let aclWhiteListURL = defaultSettings[ACL_WHITE_LIST_URL] as! String
        let aclAutoListURL = defaultSettings[ACL_AUTO_LIST_URL] as! String
        let aclProxyBackCHNURL = defaultSettings[ACL_PROXY_BACK_CHN_URL] as! String
        let socks5ListenAddress = defaultSettings[LOCAL_SOCKS5_LISTEN_ADDRESS] as! String
        let socks5ListenPort = defaultSettings[LOCAL_SOCKS5_LISTEN_PORT] as! UInt16
        let pacListenAddress = defaultSettings[PAC_SERVER_LISTEN_ADDRESS] as! String
        let pacListenPort = defaultSettings[PAC_SERVER_LISTEN_PORT] as! UInt16
        let timeout = defaultSettings[LOCAL_SOCKS5_TIMEOUT] as! UInt
        let enableUDPRelay = defaultSettings[LOCAL_SOCKS5_ENABLE_UDPRELAY] as! Bool
        let enableVerboseMode = defaultSettings[LOCAL_SOCKS5_ENABLE_VERBOSE_MODE] as! Bool

        let defaults = UserDefaults.standard
        defaults.set(gfwListURL, forKey: GFW_LIST_URL)
        defaults.set(aclWhiteListURL, forKey: ACL_WHITE_LIST_URL)
        defaults.set(aclAutoListURL, forKey: ACL_AUTO_LIST_URL)
        defaults.set(aclProxyBackCHNURL, forKey: ACL_PROXY_BACK_CHN_URL)
        defaults.set(socks5ListenAddress, forKey: LOCAL_SOCKS5_LISTEN_ADDRESS)
        defaults.set(socks5ListenPort, forKey: LOCAL_SOCKS5_LISTEN_PORT)
        defaults.set(pacListenAddress, forKey: PAC_SERVER_LISTEN_ADDRESS)
        defaults.set(pacListenPort, forKey: PAC_SERVER_LISTEN_PORT)
        defaults.set(timeout, forKey: LOCAL_SOCKS5_TIMEOUT)
        defaults.set(enableUDPRelay, forKey: LOCAL_SOCKS5_ENABLE_UDPRELAY)
        defaults.set(enableVerboseMode, forKey: LOCAL_SOCKS5_ENABLE_VERBOSE_MODE)

        NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_ADV_CONF_CHANGED), object: nil)
    }

    @IBAction func close(_ sender: NSButton) {
        window?.performClose(self)
    }
    
}
