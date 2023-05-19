import '../model/program_consume.dart';

List<ProgramConsume> programConsumeService(List<dynamic> jsonData) {
  Set<String> uniqueNames = Set<String>();
  List<ProgramConsume> models = [];
  for (var item in jsonData) {
    ProgramConsume model = ProgramConsume.fromJson(item);
    if (!uniqueNames.contains(model.name)) {
      uniqueNames.add(model.name);
      models.add(model);
    }
  }
  return models;
}

// NetworkStatistics networkStaticsService(List<dynamic> jsonData) {
//   final stats = NetworkStatistics(
//     https: HttpsStats.fromJson(jsonData[0]['https']),
//     others: OthersStats.fromJson(jsonData[0]['others']),
//     ssdp: SsdpStats.fromJson(jsonData[0]['ssdp']),
//   );
//   return stats;
// }
