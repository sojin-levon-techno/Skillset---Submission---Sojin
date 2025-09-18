import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/features/home/models/product_model.dart';
import 'package:skilltest/features/home/repository/product_remote_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>(_fetchProduct);
  }

  FutureOr<void> _fetchProduct(
    FetchProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final result = await ProductRemoteRepository.fetchProductResult();
      emit(ProductSuccess(result: result));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
