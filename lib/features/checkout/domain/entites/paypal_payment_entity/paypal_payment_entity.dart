import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  factory PaypalPaymentEntity.fromEntity({required OrderEntity orderEntity}) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'The payment transaction description.',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cartItems),
    );
  }
}
