import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/widgets/app_text.dart';

import '../cubit/app_cubits.dart';
import '../misc/colors.dart';
import '../widgets/app_bold_text.dart';
import '../widgets/responsive_button.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body : PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
            return Container(
               width: double.maxFinite,
               height: double.maxFinite,
               decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage(
                        "img/"+images[index] //BackGround
                     ),
                     fit:BoxFit.cover
                 ),

               ),
               child: Container(
                  margin: const EdgeInsets.only(top : 150 ,left : 20 , right : 20 ),
                 child : Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         AppLargeText(text: "Trips",),
                         AppText(text: "Mountain" , size: 30),
                         SizedBox(height: 20,),
                         Container(
                           width: 250,
                           child : AppText(
                             text : "Mountain hikes give you an incredible sense of freedom along with endurance test",
                             color : AppColors.textColor2,
                             size : 14,
                           ),
                         ),
                         SizedBox(height: 40,),
                         GestureDetector(
                           onTap: (){
                             BlocProvider.of<AppCubits>(context).getData();
                           },
                           child: Container(
                             width: 200,
                               child: Row(children: [ResponsiveButton(width: 120,),])

                           ),
                         ),
                       ],
                     ),
                     Column(
                       children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom : 2),
                          width: 8,
                          height: index ==indexDots ? 30 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index ==indexDots? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                       }),
                     ), // for dots
                   ],

                 ),
               ),// if you need to show the image you need boxDecoration
            );
      }),
    );
  }
}
