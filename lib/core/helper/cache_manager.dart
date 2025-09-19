import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheManagerHelper {
  static final instance = CacheManager(
    Config(
      'sixtyDayCache',
      stalePeriod: const Duration(days: 60),
      maxNrOfCacheObjects: 500,
    ),
  );
}
