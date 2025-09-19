part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

final class FetchWishListItems extends WishlistEvent {}

final class WishListOperationEvent extends WishlistEvent {
  final String productId;

  const WishListOperationEvent({required this.productId});
}
