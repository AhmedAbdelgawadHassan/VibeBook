import 'package:flutter/material.dart';

class OnboardindButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const OnboardindButton({
    super.key, required this.onpressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical:3.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xffF3C980), Color(0xffE5B56E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x55E5B56E),
                      blurRadius:10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
  child:   ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: const Color(0xff0B0D1D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(
            color: Color(0x66FFFFFF),
            width: 1,
          ),
        ),
      ),
      child:  Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontFamily: 'NotoSerif',
          fontWeight: FontWeight.w800,
        ),
      ))
    );
  }
}