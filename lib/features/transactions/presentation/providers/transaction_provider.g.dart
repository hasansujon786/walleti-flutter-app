// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allTransactionsStreamHash() =>
    r'f3835a48b2e2cbeacb72dad20fbf7e175bbfd89e';

/// See also [allTransactionsStream].
@ProviderFor(allTransactionsStream)
final allTransactionsStreamProvider =
    StreamProvider<List<TransactionData>>.internal(
  allTransactionsStream,
  name: r'allTransactionsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allTransactionsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllTransactionsStreamRef = StreamProviderRef<List<TransactionData>>;
String _$transactionListHash() => r'ebb031546c5779c5c85f2b1b85f48032dd69cd12';

/// See also [TransactionList].
@ProviderFor(TransactionList)
final transactionListProvider =
    AsyncNotifierProvider<TransactionList, List<TransactionData>>.internal(
  TransactionList.new,
  name: r'transactionListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionList = AsyncNotifier<List<TransactionData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
