//
//  Configurations.swift
//  ShadowsocksX-NG
//
//  Created by wangxufire on 2017/7/12.
//  Copyright (c) 2017 qiuyuzhou. All rights reserved.
//

import Cocoa

let SHADOWSOCKS_ON = "ShadowsocksOn"
let SHADOWSOCKS_RUNNING_MODE = "ShadowsocksRunningMode"
let LOCAL_SOCKS5_LISTEN_PORT = "LocalSocks5_ListenPort"
let LOCAL_SOCKS5_LISTEN_ADDRESS = "LocalSocks5_ListenAddress"
let PAC_SERVER_LISTEN_ADDRESS = "PacServer_ListenAddress"
let PAC_SERVER_LISTEN_PORT = "PacServer_ListenPort"
let LOCAL_SOCKS5_TIMEOUT = "LocalSocks5_Timeout"
let LOCAL_SOCKS5_ENABLE_UDPRELAY = "LocalSocks5_EnableUDPRelay"
let LOCAL_SOCKS5_ENABLE_VERBOSE_MODE = "LocalSocks5_EnableVerboseMode"
let GFW_LIST_URL = "GFWListURL"
let ACL_WHITE_LIST_URL = "ACLWhiteListURL"
let ACL_AUTO_LIST_URL = "ACLAutoListURL"
let ACL_PROXY_BACK_CHN_URL = "ACLProxyBackCHNURL"
let AUTO_CONFIGURE_NETWORK_SERVICES = "AutoConfigureNetworkServices"
let LOCAL_HTTP_LISTEN_ADDRESS = "LocalHTTP_ListenAddress"
let LOCAL_HTTP_LISTEN_PORT = "LocalHTTP_ListenPort"
let LOCAL_HTTP_ON = "LocalHTTPOn"
let LOCAL_HTTP_FOLLOW_GLOBAL = "LocalHTTP_FollowGlobal"
let AUTO_CHECK_UPDATE = "AutoCheckUpdate"
let ACL_FILE_NAME = "ACLFileName"
let ENABLE_SHOW_SPEED = "enable_showSpeed"
let CONNECT_AT_LAUNCH = "ConnectAtLaunch"
let PROXY4_NETWORK_SERVICES = "Proxy4NetworkServices"
let SERVER_PROFILES = "ServerProfiles"
let ACTIVE_SERVER_PROFILE_ID = "ActiveServerProfileId"
let SUBSCRIBES = "Subscribes"
let AUTO_UPDATE_SUBSCRIBE = "AutoUpdateSubscribe"

let MIGRATE_CONFIGURATION = "MigrateConfiguration"

@objc class Configuration: NSObject {
    override init() { super.init() }

    class func C_SHADOWSOCKS_ON() -> String { return SHADOWSOCKS_ON }
    class func C_SHADOWSOCKS_RUNNING_MODE() -> String { return SHADOWSOCKS_RUNNING_MODE }
    class func C_LOCAL_SOCKS5_LISTEN_PORT() -> String { return LOCAL_SOCKS5_LISTEN_PORT }
    class func C_LOCAL_SOCKS5_LISTEN_ADDRESS() -> String { return LOCAL_SOCKS5_LISTEN_ADDRESS }
    class func C_PAC_SERVER_LISTEN_ADDRESS() -> String { return PAC_SERVER_LISTEN_ADDRESS }
    class func C_PAC_SERVER_LISTEN_PORT() -> String { return PAC_SERVER_LISTEN_PORT }
    class func C_LOCAL_SOCKS5_TIMEOUT() -> String { return LOCAL_SOCKS5_TIMEOUT }
    class func C_LOCAL_SOCKS5_ENABLE_UDPRELAY() -> String { return LOCAL_SOCKS5_ENABLE_UDPRELAY }
    class func C_LOCAL_SOCKS5_ENABLE_VERBOSE_MODE() -> String { return LOCAL_SOCKS5_ENABLE_VERBOSE_MODE }
    class func C_GFW_LIST_URL() -> String { return GFW_LIST_URL }
    class func C_ACL_WHITE_LIST_URL() -> String { return ACL_WHITE_LIST_URL }
    class func C_ACL_AUTO_LIST_URL() -> String { return ACL_AUTO_LIST_URL }
    class func C_ACL_PROXY_BACK_CHN_URL() -> String { return ACL_PROXY_BACK_CHN_URL }
    class func C_AUTO_CONFIGURE_NETWORK_SERVICES() -> String { return AUTO_CONFIGURE_NETWORK_SERVICES }
    class func C_LOCAL_HTTP_LISTEN_ADDRESS() -> String { return LOCAL_HTTP_LISTEN_ADDRESS }
    class func C_LOCAL_HTTP_LISTEN_PORT() -> String { return LOCAL_HTTP_LISTEN_PORT }
    class func C_LOCAL_HTTP_ON() -> String { return LOCAL_HTTP_ON }
    class func C_LOCAL_HTTP_FOLLOW_GLOBAL() -> String { return LOCAL_HTTP_FOLLOW_GLOBAL }
    class func C_AUTO_CHECK_UPDATE() -> String { return AUTO_CHECK_UPDATE }
    class func C_ACL_FILE_NAME() -> String { return ACL_FILE_NAME }
    class func C_PROXY4_NETWORK_SERVICES() -> String { return PROXY4_NETWORK_SERVICES }
    class func C_SERVER_PROFILES() -> String { return SERVER_PROFILES }
    class func C_ACTIVE_SERVER_PROFILE_ID() -> String { return ACTIVE_SERVER_PROFILE_ID }
    class func C_AUTO_UPDATE_SUBSCRIBE() -> String { return AUTO_UPDATE_SUBSCRIBE }

    class func  migrate() -> Void {
        let defaults = UserDefaults.standard
        let migrated = defaults.bool(forKey: MIGRATE_CONFIGURATION)
        if !migrated {
            let OLD_LOCAL_SOCKS5_LISTEN_PORT = "LocalSocks5.ListenPort"
            let OLD_LOCAL_SOCKS5_LISTEN_ADDRESS = "LocalSocks5.ListenAddress"
            let OLD_PAC_SERVER_LISTEN_ADDRESS = "PacServer.ListenAddress"
            let OLD_PAC_SERVER_LISTEN_PORT = "PacServer.ListenPort"
            let OLD_LOCAL_SOCKS5_TIMEOUT = "LocalSocks5.Timeout"
            let OLD_LOCAL_SOCKS5_ENABLE_UDPRELAY = "LocalSocks5.EnableUDPRelay"
            let OLD_LOCAL_SOCKS5_ENABLE_VERBOSE_MODE = "LocalSocks5.EnableVerboseMode"
            let OLD_LOCAL_HTTP_LISTEN_ADDRESS = "LocalHTTP.ListenAddress"
            let OLD_LOCAL_HTTP_LISTEN_PORT = "LocalHTTP.ListenPort"
            let OLD_LOCAL_HTTP_FOLLOW_GLOBAL = "LocalHTTP.FollowGlobal"

            defaults.set(defaults.integer(forKey: OLD_LOCAL_SOCKS5_LISTEN_PORT), forKey: LOCAL_SOCKS5_LISTEN_PORT)
            defaults.set(defaults.string(forKey: OLD_LOCAL_SOCKS5_LISTEN_ADDRESS), forKey: LOCAL_SOCKS5_LISTEN_ADDRESS)
            defaults.set(defaults.string(forKey: OLD_PAC_SERVER_LISTEN_ADDRESS), forKey: PAC_SERVER_LISTEN_ADDRESS)
            defaults.set(defaults.integer(forKey: OLD_PAC_SERVER_LISTEN_PORT), forKey: PAC_SERVER_LISTEN_PORT)
            defaults.set(defaults.integer(forKey: OLD_LOCAL_SOCKS5_TIMEOUT), forKey: LOCAL_SOCKS5_TIMEOUT)
            defaults.set(defaults.bool(forKey: OLD_LOCAL_SOCKS5_ENABLE_UDPRELAY), forKey: LOCAL_SOCKS5_ENABLE_UDPRELAY)
            defaults.set(defaults.bool(forKey: OLD_LOCAL_SOCKS5_ENABLE_VERBOSE_MODE), forKey: LOCAL_SOCKS5_ENABLE_VERBOSE_MODE)
            defaults.set(defaults.string(forKey: OLD_LOCAL_HTTP_LISTEN_ADDRESS), forKey: LOCAL_HTTP_LISTEN_ADDRESS)
            defaults.set(defaults.integer(forKey: OLD_LOCAL_HTTP_LISTEN_PORT), forKey: LOCAL_HTTP_LISTEN_PORT)
            defaults.set(defaults.bool(forKey: OLD_LOCAL_HTTP_FOLLOW_GLOBAL), forKey: LOCAL_HTTP_FOLLOW_GLOBAL)

            defaults.removeObject(forKey: OLD_LOCAL_SOCKS5_LISTEN_PORT)
            defaults.removeObject(forKey: OLD_LOCAL_SOCKS5_LISTEN_ADDRESS)
            defaults.removeObject(forKey: OLD_PAC_SERVER_LISTEN_ADDRESS)
            defaults.removeObject(forKey: OLD_PAC_SERVER_LISTEN_PORT)
            defaults.removeObject(forKey: OLD_LOCAL_SOCKS5_TIMEOUT)
            defaults.removeObject(forKey: OLD_LOCAL_SOCKS5_ENABLE_UDPRELAY)
            defaults.removeObject(forKey: OLD_LOCAL_SOCKS5_ENABLE_VERBOSE_MODE)
            defaults.removeObject(forKey: OLD_LOCAL_HTTP_LISTEN_ADDRESS)
            defaults.removeObject(forKey: OLD_LOCAL_HTTP_LISTEN_PORT)
            defaults.removeObject(forKey: OLD_LOCAL_HTTP_FOLLOW_GLOBAL)

            defaults.set(true, forKey: MIGRATE_CONFIGURATION)
            defaults.synchronize()
        }
    }
}

extension UserDefaults {
    static func defaultSetting() -> [String : Any] {
        return  [
            SHADOWSOCKS_ON: true,
            SHADOWSOCKS_RUNNING_MODE: "auto",
            LOCAL_SOCKS5_LISTEN_PORT: NSNumber(value: 1086 as UInt16),
            LOCAL_SOCKS5_LISTEN_ADDRESS: "127.0.0.1",
            PAC_SERVER_LISTEN_ADDRESS: "127.0.0.1",
            PAC_SERVER_LISTEN_PORT:NSNumber(value: 8090 as UInt16),
            LOCAL_SOCKS5_TIMEOUT: NSNumber(value: 60 as UInt),
            LOCAL_SOCKS5_ENABLE_UDPRELAY: NSNumber(value: false as Bool),
            LOCAL_SOCKS5_ENABLE_VERBOSE_MODE: NSNumber(value: false as Bool),
            GFW_LIST_URL: "https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt",
            ACL_WHITE_LIST_URL: "https://raw.githubusercontent.com/shadowsocks/shadowsocks-libev/master/acl/chn.acl",
            ACL_AUTO_LIST_URL: "https://raw.githubusercontent.com/shadowsocks/shadowsocks-libev/master/acl/gfwlist.acl",
            ACL_PROXY_BACK_CHN_URL:"https://raw.githubusercontent.com/acgers/ShadowsocksX-NG-R/master/ShadowsocksX-NG/backchn.acl",
            AUTO_CONFIGURE_NETWORK_SERVICES: NSNumber(value: true as Bool),
            LOCAL_HTTP_LISTEN_ADDRESS: "127.0.0.1",
            LOCAL_HTTP_LISTEN_PORT: NSNumber(value: 1087 as UInt16),
            LOCAL_HTTP_ON: true,
            LOCAL_HTTP_FOLLOW_GLOBAL: true,
            AUTO_CHECK_UPDATE: false,
            ACL_FILE_NAME: "chn.acl",
            AUTO_UPDATE_SUBSCRIBE: false,
            SUBSCRIBES: []
        ]
    }
}
