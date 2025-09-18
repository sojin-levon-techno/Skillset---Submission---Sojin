import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/features/home/models/banner_model.dart';
import 'package:skilltest/features/home/repository/banner_remote_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    on<FetchBanner>(_fetchBanner);
  }

  FutureOr<void> _fetchBanner(
    FetchBanner event,
    Emitter<BannerState> emit,
  ) async {
    emit(BannerLoading());
    try {
      final result = await BannerRemoteRepository.fetchBanner();
      emit(BannerSuccess(result: result));
    } catch (e) {
      emit(BannerError(message: e.toString()));
    }
  }
}
