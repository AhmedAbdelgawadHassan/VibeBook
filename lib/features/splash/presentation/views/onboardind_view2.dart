import 'package:books/constants.dart';
import 'package:books/core/services/shared_preference_services.dart';
import 'package:books/core/utils/app_assets.dart';
import 'package:books/features/home/presentation/views/home_view.dart';
import 'package:books/features/splash/presentation/views/widgets/customAppbar.dart';
import 'package:books/features/splash/presentation/views/widgets/onboardind_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardindView2 extends StatelessWidget {
  const OnboardindView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xff0B0D1D),
      body: SafeArea(
        child:
           Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Customappbar(),
              Gap(20),
              Image(image: AssetImage(AppAssets.onboardingSecondImage),fit: BoxFit.contain,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Connect with \nReaders'
                ,style: TextStyle(fontFamily: 'NotoSerif',fontWeight: FontWeight.bold,fontSize: 30,color: Color(0xff9DA1FF)),),
                Gap(15),
                Text('Join a global community of bibliophiles.Share reviews, discover curated recommendations, and track your reading goals.'
                ,style:TextStyle(fontFamily: 'manrope',color: Colors.grey,fontSize: 16) ,)
                ],
              ) ,),
              Spacer(),
              OnboardindButton(onpressed: ()async{
                await Prefs.setBool(kOnboardingSeen, true);   
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeView(),) );
              }, text: "Get Started"),
              Gap(8),
            ],
          ),
        ),
      
    );
  }
}
