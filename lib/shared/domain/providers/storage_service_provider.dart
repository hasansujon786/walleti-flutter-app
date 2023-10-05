import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/storage_service_impl.dart';

final storageServiceProvider = Provider((ref) {
  final StorageServiceImpl prefsService = StorageServiceImpl();
  prefsService.init();
  return prefsService;
});
