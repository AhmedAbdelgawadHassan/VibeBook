import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:books/features/seacrh/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu,color: AppColors.secondaryColor,),
        title: Text('VibeBook',style: TextStyle(fontSize: 20,fontFamily: 'manrope',fontWeight: FontWeight.w800,color: AppColors.secondaryColor),),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView()));
              },
            icon: Icon(FontAwesomeIcons.magnifyingGlass.data,color: Colors.white,)),
            Gap(12),
        ],
      ),
      
      body: HomeViewBody(),
    );
  }
}