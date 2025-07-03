import 'package:get_it/get_it.dart';
import 'package:todo_list/core/database/cache/cache_helper.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //! auth
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
