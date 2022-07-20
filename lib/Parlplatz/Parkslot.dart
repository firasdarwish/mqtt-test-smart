// ignore_for_file: file_names

class ParkingSlot {
  final String name;
  final String state;
  final String info;

  ParkingSlot(this.name, this.state, this.info);

  factory ParkingSlot.fromJson(dynamic json) {
    return ParkingSlot(json['name'], json['state'], json['info']);
  }

  @override
  String toString() {
    // ignore: unnecessary_this
    return '{ ${this.name}, ${this.state} }';
  }
}
