import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_bold_text.dart';
import 'package:travel/widgets/app_buttons.dart';
import 'package:travel/widgets/responsive_button.dart';

import '../cubit/app_cubit_states.dart';
import '../widgets/app_text.dart';

class DetailPage extends StatefulWidget {

  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits,CubitStates>(

      builder: (context,state){
        DetailState detial = state as DetailState;
         return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:  NetworkImage("http://mark.bslmeiyu.com/uploads/" + detial.place.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ), // photo
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ), // icon
                Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detial.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$"+ detial.place.price.toString(),
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            AppText(
                              text: detial.place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                    color: detial.place.stars + 1 > index ? AppColors
                                        .starColor : AppColors.textColor2,);
                                })),
                            SizedBox(width: 10,),
                            AppText(text: "(5.0)", color: AppColors.textColor2,)
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(text: "Number of people in your group",
                            color: AppColors.mainTextColor),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: selectedIndex == index? Colors.white : Colors.black,
                                  backgoundColor: selectedIndex==index? Colors.black :AppColors.buttonBackground  ,
                                  size: 50,
                                  borderColor:selectedIndex==index? Colors.black: AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(text : "Description" , color: Colors.black.withOpacity(0.8),),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(text:detial.place.description, color: AppColors.mainTextColor,)
                      ],
                    ),
                  ),
                ), // containter
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child:Row(
                    children: [
                      AppButtons(color:AppColors.textColor2 ,
                        backgoundColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        size: 50,
                        isIcon: true,
                        icon:Icons.favorite_border,
                      ),
                      SizedBox(width: 20,),
                      ResponsiveButton(
                        isResponsive: true,

                      ),
                    ],
                  ),
                ),// bottons
              ],
            ),
          ),
        );
      }
    );
  }
}
