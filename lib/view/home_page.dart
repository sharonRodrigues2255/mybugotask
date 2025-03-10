import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screen_async_provider.dart';
import 'package:flutter_application_1/helpers/consts.dart';
import 'package:flutter_application_1/helpers/size_config.dart';
import 'package:flutter_application_1/model/workshop_model.dart';
import 'package:flutter_application_1/view/widgets/main_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenAsyncProvider>(context, listen: true);
    final challenges = provider.challenges;
    final liveVideos = provider.liveWorkshops;
    final recordedVideos = provider.recordedVideos;

    List carouselIcons = [
      CarouselIcons.recipes,
      CarouselIcons.Activities,
      CarouselIcons.WorkSheets,
      CarouselIcons.blogs,
    ];
    List carouselLabels = ['Recipes', 'Activities', 'WorkSheets', 'Blogs'];

    return (provider.errorMessage!='')
        ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.errorMessage),
                ElevatedButton(
                  onPressed: () {
                    provider.refresh();
                  },
                  child: Text("Retry"),
                ),
              ],
            ),
          ),
        )
        : Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  selectionHeightStyle: BoxHeightStyle.tight,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    fillColor: Color(0xFFE8E8E8),
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.mic, color: Colors.grey, size: 30),
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Center(
                              child: Image.asset(carouselIcons[index]),
                            ),
                          ),
                          Text(
                            carouselLabels[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                SizedBox(
                  height: 168.0.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            height: 163,
                            width: 309,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage('assets/carousal_image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 9,
                            left: 9,
                            child: Image.asset('assets/myburgo_white.png'),
                          ),
                          Positioned(
                            top: 38,
                            left: 9,
                            child: Text(
                              'Get 50% Off',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 33),
                Text(
                  "Challenges curated for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 270.0.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15);
                    },
                    itemCount: challenges?.length??0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final challenge = challenges?[index];

                      return MainWidgetBox(workShopItem: challenge??Workshop());
                    },
                  ),
                ),
                SizedBox(height: 33),
                Text(
                  'Recorded videos for you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 270.0.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15);
                    },
                    itemCount: recordedVideos?.length??0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final video = recordedVideos?[index];
                      return MainWidgetBox(workShopItem: video??Workshop());
                    },
                  ),
                ),
                SizedBox(height: 33),
                Text(
                  'Live workshops for you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 270.0.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15);
                    },
                    itemCount: liveVideos?.length??0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final liveWorkshop = liveVideos?[index];

                      return MainWidgetBox(workShopItem: liveWorkshop??Workshop());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
