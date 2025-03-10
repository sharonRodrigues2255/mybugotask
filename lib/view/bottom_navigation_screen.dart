import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/size_config.dart';
import 'package:flutter_application_1/view/home_page.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(leadingWidth: 120,leading: Image.asset('assets/appicon.png',height: 23.0.h,width: 83.0.w,),actions: [Icon(Icons.favorite_border_outlined,color: Color(0xFFF94141),),SizedBox(width: 20),Image.asset('assets/profile.png'),SizedBox(width: 20)],),
    body: HomePage(),
        bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF602EF4), Color.fromARGB(255, 248, 173, 255)], 
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: IgnorePointer(ignoring: true,
          child: MotionTabBar(tabIconSelectedColor: Color(0xFF602EF4),
            initialSelectedTab: 'Home',textStyle: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w700),
            labelAlwaysVisible: true,
            tabSelectedColor: Colors.white,
            labels: ['Home', 'Childcare', 'Self care', 'Community', 'My Learning'],
            tabIconColor: Colors.white,
            tabBarColor: Color(0xFF602EF4),
            iconWidgets: [
              Icon(Icons.home,size: 40,color: Color(0xFF602EF4),),
             Image.asset('assets/childcare.png'),
              Image.asset('assets/selfcare.png'),
              Image.asset('assets/community.png'),
              Image.asset('assets/learning.png'),
            ],
          ),
        ),
        )
    );
  }
}