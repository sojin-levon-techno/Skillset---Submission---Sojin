part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistSuccess extends WishlistState {
  final List<WishListModel> result;

  const WishlistSuccess({required this.result});
}

final class WishListOperationSuccess extends WishlistState {
  final String message;

  const WishListOperationSuccess({required this.message});
}

final class WishlistError extends WishlistState {
  final String message;

  const WishlistError({required this.message});
}
