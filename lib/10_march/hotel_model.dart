class HotelModel {
  String? hotelId;
  String? hotelName;
  List<String>? hotelImages;
  int? hotelRating;
  GeoLocations? geoLocations;
  Address? address;

  HotelModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['id'];
    hotelName = json['name'];
    //converting images
    List<dynamic> imageData = json['img'];
    hotelImages = [];
    for (var element in imageData) {
      hotelImages!.add(element['url']);
    }
    hotelRating = json['rt'];
    geoLocations = GeoLocations.fromJson(json['gl']);
    address = Address.fromJson(json['ad']);
  }
}

class GeoLocations {
  String? latitude;
  String? longitude;

  GeoLocations.fromJson(Map<String, dynamic> json) {
    latitude = json['lt'];
    longitude = json['ln'];
  }
}

class Address {
  String? houseNumber;
  String? area;
  String? city;
  String? country;
  String? pinCode;

  Address.fromJson(Map<String, dynamic> json) {
    houseNumber = json['adr'];
    area = json['adr2'];
    pinCode = json['postalCode'];
    city = json['city']['name'];
    country = json['country']['name'];
  }
}
