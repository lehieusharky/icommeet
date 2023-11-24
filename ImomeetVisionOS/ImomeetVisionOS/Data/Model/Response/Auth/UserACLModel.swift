//
// ACLDataModel.swift
// ImomeetVisionOS
//
// Created by Thien Vu on 28/10/2023.
//
import Foundation
class UserACLModel: CodingObject {
  private(set) var app_share: String = ""
  private(set) var send_file: String = ""
  private(set) var max_video_size: String = ""
  private(set) var mcu: String = ""
  private(set) var p2p: String = ""
  private(set) var whiteboard: String = ""
  private(set) var inspecting: String = ""
  private(set) var dicSystemExt: [String: Any] = [:]
  override init() {
    super.init()
    setDefaultValue()
  }
  init(dict: [String: Any]) {
    super.init()
    if let userACL = dict["user_acl"] as? [String: Any] {
      self.app_share = "\(userACL["app_share"] ?? "")"
      self.send_file = "\(userACL["send_file"] ?? "")"
      self.max_video_size = "\(userACL["max_video_size"] ?? "")"
      self.mcu = "\(userACL["mcu"] ?? "")"
      self.p2p = "\(userACL["p2p"] ?? "")"
      self.whiteboard = "\(userACL["whiteboard"] ?? "")"
      self.inspecting = "\(userACL["inspecting"] ?? "")"
    }
    if let systemExt = dict["system_ext"] as? String, let data = systemExt.data(using: .utf8) {
      if let jsonDict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
        self.dicSystemExt = jsonDict
      }
    }
  }
  private func setDefaultValue() {
    send_file = "1"
    mcu = "1"
    p2p = "1"
    max_video_size = "720"
    whiteboard = "1"
  }
  func encode(with aCoder: NSCoder) {
    aCoder.encode(app_share, forKey: "app_share")
    aCoder.encode(mcu, forKey: "mcu")
    aCoder.encode(send_file, forKey: "send_file")
    aCoder.encode(max_video_size, forKey: "max_video_size")
    aCoder.encode(p2p, forKey: "p2p")
    aCoder.encode(whiteboard, forKey: "whiteboard")
    aCoder.encode(inspecting, forKey: "inspecting")
    aCoder.encode(dicSystemExt, forKey: "system_ext")
  }
  required init?(coder aDecoder: NSCoder) {
    app_share = aDecoder.decodeObject(forKey: "app_share") as? String ?? ""
    mcu = aDecoder.decodeObject(forKey: "mcu") as? String ?? ""
    send_file = aDecoder.decodeObject(forKey: "send_file") as? String ?? ""
    max_video_size = aDecoder.decodeObject(forKey: "max_video_size") as? String ?? ""
    p2p = aDecoder.decodeObject(forKey: "p2p") as? String ?? ""
    whiteboard = aDecoder.decodeObject(forKey: "whiteboard") as? String ?? ""
    inspecting = aDecoder.decodeObject(forKey: "inspecting") as? String ?? ""
    dicSystemExt = aDecoder.decodeObject(forKey: "system_ext") as? [String: Any] ?? [:]
    super.init()
  }
}









