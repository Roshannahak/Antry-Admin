import 'package:antry_admin/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCardViewholder extends StatelessWidget {
  const DetailCardViewholder(
      {Key? key, required this.cardTitle, this.data, this.icon = Icons.widgets})
      : super(key: key);

  final String cardTitle;
  final int? data;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.5),
            height: 50,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(5)),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        "$data",
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Center(
                        child: Icon(icon,
                            size: 24.r,
                            color: AppColor.primaryColor50),
                      ),
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
