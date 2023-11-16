// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:walleti/features/transactions/data/repository/transaction_repository_impl.dart'
    as _i5;
import 'package:walleti/features/transactions/domain/repository/transaction_repository.dart'
    as _i4;
import 'package:walleti/shared/data/local/database.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppDatabase>(
      _i3.AppDatabase(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i4.TransactionRepository>(
        () => _i5.TransactionRepositoryImpl(gh<_i3.AppDatabase>()));
    return this;
  }
}
