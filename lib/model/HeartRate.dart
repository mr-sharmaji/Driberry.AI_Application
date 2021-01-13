class HeartRate {
  final String id;
  final String time;

  HeartRate({this.id, this.time});

  factory HeartRate.fromJson(Map<String, dynamic> json) {
    return HeartRate(
      id: json['id'],
      time: json['time'],
    );
  }
}