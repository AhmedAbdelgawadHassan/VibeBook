import 'package:books/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.bookOpen.data,color: Color(0xffABACE4),size: 20,),
            Gap(10),
            SvgPicture.asset(AppAssets.appNameLogo,height: 20,)
          ],
        );
  }
}