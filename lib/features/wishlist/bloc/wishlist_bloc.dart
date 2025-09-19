import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/features/wishlist/models/wishlist_model.dart';
import 'package:skilltest/features/wishlist/repository/wishlist_remote_repository.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<FetchWishListItems>(_fetchWishListItems);
    on<WishListOperationEvent>(_wishListOperationEvent);
  }

  FutureOr<void> _fetchWishListItems(
    FetchWishListItems event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());

    try {
      final result = await WishlistRemoteRepository.fetchWishlist();
      emit(WishlistSuccess(result: result));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }

  FutureOr<void> _wishListOperationEvent(
    WishListOperationEvent event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      final message = await WishlistRemoteRepository.wishListOperation(
        event.productId,
      );

      emit(WishListOperationSuccess(message: message));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }
}
