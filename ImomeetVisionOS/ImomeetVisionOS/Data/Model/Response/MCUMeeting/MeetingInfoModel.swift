
//
//  MeetingInfoModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class MeetingInfoModel: Codable, Identifiable {
    public let chairmanId: Int?
    public let channelId: Int?
    public let closeOnChairmanQuit: Int?
    public let conferenceId: Int?
    public let createTime: Int?
    public let duration: Int?
    public let extra: String?
    public let fromMem: Int?
    public let localRecording: Int?
    public let mcuId: Int?
    public let meetingId: Int?
    public let meetingStatus: Int?
    public let moodleSession: Int?
    public let noVideo: Int?
    public let participants: [ParticipantModel]?
    public let password: String?
    public let pendingApproval: Int?
    public let recId: Int?
    public let recording: Int?
    public let requirePassword: Int?
    public let roomId: Int?
    public let roomName: String?
    public let secret: String?
    public let startTime: Int?
    public let streamingSvr: String?
    public let timeZone: Int?
    public let topic: String?
    public let validPassword: Int?
    public let wantLive: Int?
    public let wantVod: Int?
    
    private enum CodingKeys: String, CodingKey {
        case chairmanId = "chairman_id"
        case channelId = "channel_id"
        case closeOnChairmanQuit = "close_on_chairman_quit"
        case conferenceId = "conference_id"
        case createTime = "create_time"
        case duration = "duration"
        case extra = "extra"
        case fromMem = "from_mem"
        case localRecording = "local_recording"
        case mcuId = "mcu_id"
        case meetingId = "meeting_id"
        case meetingStatus = "meeting_status"
        case moodleSession = "moodle_session"
        case noVideo = "no_video"
        case participants = "participants"
        case password = "password"
        case pendingApproval = "pending_approval"
        case recId = "rec_id"
        case recording = "recording"
        case requirePassword = "require_password"
        case roomId = "room_id"
        case roomName = "room_name"
        case secret = "secret"
        case startTime = "start_time"
        case streamingSvr = "streaming_svr"
        case timeZone = "time_zone"
        case topic = "topic"
        case validPassword = "valid_password"
        case wantLive = "want_live"
        case wantVod = "want_vod"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chairmanId: try? container.decodeIfPresent(Int.self, forKey: .chairmanId)
        self.channelId: try? container.decodeIfPresent(Int.self, forKey: .channelId)
        self.closeOnChairmanQuit: try? container.decodeIfPresent(Int.self, forKey: .closeOnChairmanQuit)
        self.conferenceId: try? container.decodeIfPresent(Int.self, forKey: .conferenceId)
        self.createTime: try? container.decodeIfPresent(Int.self, forKey: .createTime)
        self.duration: try? container.decodeIfPresent(Int.self, forKey: .duration)
        self.extra: try? container.decodeIfPresent(String.self, forKey: .extra)
        self.fromMem: try? container.decodeIfPresent(Int.self, forKey: .fromMem)
        self.localRecording: try? container.decodeIfPresent(Int.self, forKey: .localRecording)
        self.mcuId: try? container.decodeIfPresent(Int.self, forKey: .mcuId)
        self.meetingId: try? container.decodeIfPresent(Int.self, forKey: .meetingId)
        self.meetingStatus: try? container.decodeIfPresent(Int.self, forKey: .meetingStatus)
        self.moodleSession: try? container.decodeIfPresent(Int.self, forKey: .moodleSession)
        self.noVideo: try? container.decodeIfPresent(Int.self, forKey: .noVideo)
        self.participants: try? container.decodeIfPresent([ParticipantModel].self, forKey: .participants)
        self.password: try? container.decodeIfPresent(String.self, forKey: .password)
        self.pendingApproval: try? container.decodeIfPresent(Int.self, forKey: .pendingApproval)
        self.recId: try? container.decodeIfPresent(Int.self, forKey: .recId)
        self.recording: try? container.decodeIfPresent(Int.self, forKey: .recording)
        self.requirePassword: try? container.decodeIfPresent(Int.self, forKey: .requirePassword)
        self.roomId: try? container.decodeIfPresent(Int.self, forKey: .roomId)
        self.roomName: try? container.decodeIfPresent(String.self, forKey: .roomName)
        self.secret: try? container.decodeIfPresent(String.self, forKey: .secret)
        self.startTime: try? container.decodeIfPresent(Int.self, forKey: .startTime)
        self.streamingSvr: try? container.decodeIfPresent(String.self, forKey: .streamingSvr)
        self.timeZone: try? container.decodeIfPresent(Int.self, forKey: .timeZone)
        self.topic: try? container.decodeIfPresent(String.self, forKey: .topic)
        self.validPassword: try? container.decodeIfPresent(Int.self, forKey: .validPassword)
        self.wantLive: try? container.decodeIfPresent(Int.self, forKey: .wantLive)
        self.wantVod: try? container.decodeIfPresent(Int.self, forKey: .wantVod)
    }
}
