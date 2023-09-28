class EarthQuakeItem {
  late String id;
  late String location;
  late String lat;
  late String long;
  late String mag;
  late String depth;
  late int time;

  EarthQuakeItem(
      {required this.id,
      required this.location,
      required this.lat,
      required this.long,
      required this.mag,
      required this.depth,
      required this.time});

  EarthQuakeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    lat = json['lat'];
    long = json['long'];
    mag = json['mag'];
    depth = json['depth'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['location'] = location;
    data['lat'] = lat;
    data['long'] = long;
    data['mag'] = mag;
    data['depth'] = depth;
    data['time'] = time;
    return data;
  }
}
