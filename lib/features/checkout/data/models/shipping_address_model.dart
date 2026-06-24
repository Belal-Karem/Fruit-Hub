import 'package:fruit_hub/features/checkout/domain/entites/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? floorNumber;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.floorNumber,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      floorNumber: entity.floorNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'city': city,
      'floorNumber': floorNumber,
    };
  }
}
