
// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChartModel {
  int? time;
  double? open;
  double? high;
  double? low;
  double? close;
  ChartModel({
    this.time = 0,
    this.open,
    this.high,
    this.low,
    this.close,
  });
  factory ChartModel.fromJson(List l) {
    return ChartModel(
      time: l[0] == null ? null : l[0]!,
      open: l[1] == null ? null : l[1]!,
      high: l[2] == null ? null : l[2]!,
      low: l[3] == null ? null : l[3]!,
      close: l[4] == null ? null : l[4]!,
    );
  }
  // factory ChartModel.fromJson(Map<String, dynamic> json) {
  //   return ChartModel(
  //     time: json['time'] != null ? json['time'] as int : null,
  //     open: json['open'] != null ? json['open'] as double : null,
  //     high: json['high'] != null ? json['high'] as double : null,
  //     low: json['low'] != null ? json['low'] as double : null,
  //     close: json['close'] != null ? json['close'] as double : null,
  //   );
  // }
}
