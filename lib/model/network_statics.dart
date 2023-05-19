class NetworkStatistics {
  HttpsStats? https;
  OthersStats? others;
  SsdpStats? ssdp;

  NetworkStatistics({
    this.https,
    this.others,
    this.ssdp,
  });

  factory NetworkStatistics.fromJson(Map<String, dynamic> json) {
    return NetworkStatistics(
      https: json['https'] != null ? HttpsStats.fromJson(json['https']) : null,
      others:
          json['others'] != null ? OthersStats.fromJson(json['others']) : null,
      ssdp: json['ssdp'] != null ? SsdpStats.fromJson(json['ssdp']) : null,
    );
  }
}

class HttpsStats {
  String? total;
  String? download;
  String? upload;

  HttpsStats({
    this.total,
    this.download,
    this.upload,
  });

  factory HttpsStats.fromJson(Map<String, dynamic> json) {
    return HttpsStats(
      total: json['total'],
      download: json['download'],
      upload: json['upload'],
    );
  }
}

class OthersStats {
  String? total;
  String? download;
  String? upload;

  OthersStats({
    this.total,
    this.download,
    this.upload,
  });

  factory OthersStats.fromJson(Map<String, dynamic> json) {
    return OthersStats(
      total: json['total'],
      download: json['download'],
      upload: json['upload'],
    );
  }
}

class SsdpStats {
  String? total;
  String? download;
  String? upload;

  SsdpStats({
    this.total,
    this.download,
    this.upload,
  });

  factory SsdpStats.fromJson(Map<String, dynamic> json) {
    return SsdpStats(
      total: json['total'],
      download: json['download'],
      upload: json['upload'],
    );
  }
}

class Item {
  String? name;
  String? createTime;
  String? lastTimeUpdated;
  String? upload;
  String? download;
  String? uploadSpeed;
  String? downloadSpeed;

  Item({
    this.name,
    this.createTime,
    this.lastTimeUpdated,
    this.upload,
    this.download,
    this.uploadSpeed,
    this.downloadSpeed,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      createTime: json['create_Time'],
      lastTimeUpdated: json['last_time_updated'],
      upload: json['upload'],
      download: json['download'],
      uploadSpeed: json['upload_speed'],
      downloadSpeed: json['download_speed'],
    );
  }
}

class Network {
  String? host;
  String? total;
  String? download;
  String? upload;

  Network({
    this.host,
    this.total,
    this.download,
    this.upload,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      host: json['host'],
      total: json['total'],
      download: json['download'],
      upload: json['upload'],
    );
  }
}
