class ShippingAddressEntity {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? floorNumber;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.floorNumber,
  });

  @override
  String toString() {
    return '$address $floorNumber $city';
  }
}
