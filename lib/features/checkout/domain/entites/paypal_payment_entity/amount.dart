import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

import '../../../../../core/helper_functions/get_currency.dart';
import 'details_entity.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  factory Amount.fromEntity(OrderEntity orderEntity) {
    return Amount(
      total: orderEntity.calculatedTotalPrice().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(orderEntity),
    );
  }
}
