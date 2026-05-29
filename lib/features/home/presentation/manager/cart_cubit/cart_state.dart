part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartItemadded extends CartState {}

final class CartItemRemoved extends CartState {}
