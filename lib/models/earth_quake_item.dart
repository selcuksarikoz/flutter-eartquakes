class EarthQuakeItem {
  String? id;
  String? location;
  String? lat;
  String? long;
  String? mag;
  String? depth;
  int? time;

  EarthQuakeItem(
      {this.id,
      this.location,
      this.lat,
      this.long,
      this.mag,
      this.depth,
      this.time});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location'] = this.location;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['mag'] = this.mag;
    data['depth'] = this.depth;
    data['time'] = this.time;
    return data;
  }
}
