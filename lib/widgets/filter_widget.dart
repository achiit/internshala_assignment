import 'package:flutter/material.dart';
import 'package:internshala_assignment/constants/appcolors.dart';

class FilterWidget extends StatelessWidget {
  String title;
  String subtitle;
  Widget child;
  void Function()? ontap;
  FilterWidget({
    super.key,
    required this.child,
    required this.title,
    required this.subtitle,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Color(0xff6C757D)
              // fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: 0,
        ),
        child,
        InkWell(
          onTap: ontap,
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: AppColors.primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Add $subtitle",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
