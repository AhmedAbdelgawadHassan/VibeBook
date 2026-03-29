import 'package:books/core/services/service_locator.dart';
import 'package:books/core/services/shared_preference_services.dart';
import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/data/repos/home_repo_impl.dart';
import 'package:books/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:books/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_states.dart';
import 'package:books/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:books/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_states.dart';
import 'package:books/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();

  /// This is the shared preferences (Singleton pattern) intialized
  setupLocator(); // This is the service locator (Singleton pattern)
  runApp(const VibeBook());
}

class VibeBook extends StatelessWidget {
  const VibeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Provider more than one Cubit
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FeaturedBooksInitialState(), // initial state
            homeRepo: getIt
                .get<
                  HomeRepoImpl
                >(), // homeRepo (Singleton pattern on the service locator)
          )..featchFeaturedBooks(), // Cascad OPerator to call the method after the cubit is created Directly
        ),

        BlocProvider(
          create: (context) => NewestBooksCubit(
            NewestBooksInitialState(),
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
