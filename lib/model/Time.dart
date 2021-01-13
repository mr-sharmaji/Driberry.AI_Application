class Time {
  final String id;
  final String time;

  Time({this.id, this.time});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      id: json['id'],
      time: json['time'],
    );
  }
}