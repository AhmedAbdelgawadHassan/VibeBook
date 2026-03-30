import 'package:books/core/utils/app_colors.dart';
import 'package:books/core/presentation/manager/cubits/theme_cubit/theme_cubit.dart';
import 'package:books/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:books/features/seacrh/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        final iconColor = isDark ? Colors.white : Colors.black;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(Icons.menu, color: AppColors.secondaryColor),
            title: Text(
              'VibeBook',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'manrope',
                fontWeight: FontWeight.w800,
                color: AppColors.secondaryColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchView()),
                  );
                },
                icon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: iconColor,
                ),
              ),
              Gap(12),
              IconButton(
                onPressed: () => context.read<ThemeCubit>().toggle(),
                icon: Icon(
                  isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                  color: iconColor,
                ),
              ),
              const Gap(8),
            ],
          ),
          body: HomeViewBody(),
        );
      },
    );
  }
}
