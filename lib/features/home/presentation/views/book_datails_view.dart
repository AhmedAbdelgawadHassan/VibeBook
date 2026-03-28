import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/presentation/views/widgets/book_detailed_card.dart';
import 'package:books/features/home/presentation/views/widgets/book_details_info.dart';
import 'package:books/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:books/features/home/presentation/views/widgets/freeReadind_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookDatailsView extends StatelessWidget {
  const BookDatailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu,color: AppColors.secondaryColor,),
        title: Text('VibeBook',style: TextStyle(fontSize: 20,fontFamily: 'manrope',fontWeight: FontWeight.w800,color: AppColors.secondaryColor),),
        actions: [
          Icon(FontAwesomeIcons.solidCircleUser.data,color: AppColors.secondaryColor,),
            Gap(12),
        ],
      ),
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
                child: CustomBookImage(
                  bookImage: 'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1xw:0.74975xh;0,0.190xh',
                )),
              Gap(15),
              Text('The Midnight Echo',style: TextStyle(fontSize: 36,fontFamily: 'NotoSerif',fontWeight: FontWeight.bold),),
              Gap(7),
              Text('By Elena Valerius',style: TextStyle(fontSize: 20,fontFamily: 'manrope',fontWeight: FontWeight.w500,color: AppColors.secondaryColor),),
              Gap(25),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
              BookDetailedCard(
                title: 'Price',
                value: '20.18 USD',
                titleColor: Colors.red,
              ),
              Gap(10),
               BookDetailedCard(
                title: 'Readers',
                value: '12.4k',
                titleColor: Colors.green,
              ),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                     BookDetailedCard(
                title: 'Rating',
                value:'⭐ 4.8',
                titleColor: Colors.yellow,
              ),
              Gap(10),
               BookDetailedCard(
                title: 'pages',
                value: '342',
                titleColor: Colors.blue,
              ),
                  ],
                )
              ],
             ),
              Gap(25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Description',
                style: TextStyle(fontSize: 24,fontFamily: 'NotoSerif',fontWeight: FontWeight.w800,color: Colors.white),),
              ),
              const Gap(10),
              Text("In the fog-drenched streets of a city that never remembers its own name, a young clockmaker discovers a blueprint for a machine that can transcribe the music of dreams. But as the gears begin to turn, the boundary between reality and the ethereal world begins to fray.",
              style: TextStyle(fontSize: 18,fontFamily: 'manrope',fontWeight: FontWeight.w400,color: Color(0xffD6D3D1)),),
              Gap(30),
              BookDatailsInfo(),
              Gap(40),
              FreereadindButton(
                onpressed: () {
                     ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Free reading is coming soon.....',
                style: TextStyle(fontFamily: 'NotoSerif',fontWeight: FontWeight.bold),
              ),
            ),
          );
                },
              ),
              Gap(20),

            ],
          ),
        ), 
          )
        ],
      )
     
    );
  }
}


