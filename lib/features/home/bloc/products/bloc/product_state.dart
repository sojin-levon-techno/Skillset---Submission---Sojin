part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> result;

  const ProductSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

final class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});
}
