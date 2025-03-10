
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/size_config.dart';
import 'package:flutter_application_1/model/workshop_model.dart';

class MainWidgetBox extends StatelessWidget {
  final Workshop workShopItem;
  const MainWidgetBox({super.key,required this.workShopItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 270.0.h,
          width: 280.0.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: CachedNetworkImage(fit: BoxFit.contain,
                    imageUrl: workShopItem.thumbnail??'',
                    errorWidget:
                        (context, url, error) =>
                            Center(child: Text("Error loading image")),
                    placeholder:
                        (context, url) =>
                            Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: 150.0.h,
                width: 280.0.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workShopItem.title??'',
                      maxLines: 1,overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      workShopItem.expertName??'',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...[
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                   "${workShopItem.discountPercentage.toStringAsFixed(0)}%",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFF3C3C),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '₹ ${workShopItem.sellingPrice}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFF3C3C),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'M.R.P: ₹${workShopItem.mrp}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  color: Color(0xFF9A9A9A),
                                ),
                              ),
                            ],
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 23,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF67A1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Buy now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color:workShopItem.type!="Live Schedule"?Color(0xFFC3E5FF): Color(0xFFFFA3A3),
              ),
              child: Text(
                workShopItem.type??'',
                style: TextStyle(fontSize: 8, color: Color(0xFFAC2020)),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 133.0.h,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Starts ${workShopItem.startDateTime}",
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


