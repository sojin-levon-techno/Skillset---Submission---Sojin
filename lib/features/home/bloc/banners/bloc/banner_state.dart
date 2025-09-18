part of 'banner_bloc.dart';

sealed class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerSuccess extends BannerState {
  final List<BannerModel> result;

  const BannerSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

final class BannerError extends BannerState {
  final String message;

  const BannerError({required this.message});
}
