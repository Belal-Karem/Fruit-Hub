import '../../../../core/utils/app_images.dart';

class OrderTrackingEntity {
  final String title;
  final String? date;
  final String icon;
  final bool isCompleted;

  const OrderTrackingEntity({
    required this.title,
    this.date,
    required this.icon,
    required this.isCompleted,
  });
}

final List<OrderTrackingEntity> orderTrackingList = const [
  OrderTrackingEntity(
    title: 'تتبع الطلب',
    date: '22 مارس، 2024',
    icon: Assets.imagesOrderTrackIcon,
    isCompleted: true,
  ),
  OrderTrackingEntity(
    title: 'قبول الطلب',
    date: '22 مارس، 2024',
    icon: Assets.imagesOrderCheckedIcon,
    isCompleted: true,
  ),
  OrderTrackingEntity(
    title: 'تم شحن الطلب',
    date: '22 مارس، 2024',
    icon: Assets.imagesOrderShippedIcon,
    isCompleted: true,
  ),
  OrderTrackingEntity(
    title: 'خرج للتوصيل',
    icon: Assets.imagesOrdeDeliveryIcon,
    date: '22 مارس، 2024',
    isCompleted: false,
  ),
  OrderTrackingEntity(
    title: 'تم تسليم',
    icon: Assets.imagesOrderReceiveIcon,
    date: '22 مارس، 2024',
    isCompleted: false,
  ),
];
