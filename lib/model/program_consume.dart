
class ProgramConsume {
    String pid;
    String name;
    String createTime;
    String lastTimeUpdate;
    String upload;
    String download;
    String uploadSpeed;
    String downloadSpeed;
    List<ProtocolTraffic> protocolTraffic;
    List<HostTraffic> hostTraffic;

    ProgramConsume({
        required this.pid,
        required this.name,
        required this.createTime,
        required this.lastTimeUpdate,
        required this.upload,
        required this.download,
        required this.uploadSpeed,
        required this.downloadSpeed,
        required this.protocolTraffic,
        required this.hostTraffic,
    });

    factory ProgramConsume.fromJson(Map<String, dynamic> json) => ProgramConsume(
        pid: json["pid"],
        name: json["name"],
        createTime: json["create_time"],
        lastTimeUpdate: json["last_time_update"],
        upload: json["upload"],
        download: json["download"],
        uploadSpeed: json["upload_speed"],
        downloadSpeed: json["download_speed"],
        protocolTraffic: List<ProtocolTraffic>.from(json["protocol_traffic"].map((x) => ProtocolTraffic.fromJson(x))),
        hostTraffic: List<HostTraffic>.from(json["host_traffic"].map((x) => HostTraffic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pid": pid,
        "name": name,
        "create_time": createTime,
        "last_time_update": lastTimeUpdate,
        "upload": upload,
        "download": download,
        "upload_speed": uploadSpeed,
        "download_speed": downloadSpeed,
        "protocol_traffic": List<dynamic>.from(protocolTraffic.map((x) => x.toJson())),
        "host_traffic": List<dynamic>.from(hostTraffic.map((x) => x.toJson())),
    };
}

class HostTraffic {
    String host;
    String download;
    String upload;

    HostTraffic({
        required this.host,
        required this.download,
        required this.upload,
    });

    factory HostTraffic.fromJson(Map<String, dynamic> json) => HostTraffic(
        host: json["host"],
        download: json["download"],
        upload: json["upload"],
    );

    Map<String, dynamic> toJson() => {
        "host": host,
        "download": download,
        "upload": upload,
    };
}

class ProtocolTraffic {
    String protocol;
    String download;
    String upload;

    ProtocolTraffic({
        required this.protocol,
        required this.download,
        required this.upload,
    });

    factory ProtocolTraffic.fromJson(Map<String, dynamic> json) => ProtocolTraffic(
        protocol: json["protocol"],
        download: json["download"],
        upload: json["upload"],
    );

    Map<String, dynamic> toJson() => {
        "protocol": protocol,
        "download": download,
        "upload": upload,
    };
}
