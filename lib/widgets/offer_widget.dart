import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internshala_assignment/constants/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CourseOfferWidget extends StatelessWidget {
  const CourseOfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 18, bottom: 18),
      child: InkWell(
        splashColor: Colors.red,
        child: Ink(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Adaptive.w(70), // Increased from 60 to 75

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/clock.svg",
                          height: 25,
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            "Final hours left to unleash your true potential!",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                            // maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: Adaptive.w(20),
                      height: Adaptive.h(3.2),
                      decoration: BoxDecoration(
                        color: Color(0xffFF8B00),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Offer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 14.0, bottom: 14, right: 130),
                child: Text(
                  "By enrolling in all online training at 55%+10% OFF",
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AutoSizeText.rich(
                TextSpan(
                  text: "Use coupon: ",
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "YEAR5510",
                      style: TextStyle(
                        // fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/timer.svg",
                      height: 17,
                    ),
                    SizedBox(width: 5),
                    AutoSizeText.rich(
                      TextSpan(
                        text: "Offer ends in",
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: " 02:15:30",
                            style: TextStyle(
                              // fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, bottom: 12),
                child: Text(
                  "Choose from Web Dev, Python, Data Science, Marketing & more",
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Internshala Certified Trainings",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff484848),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: AutoSizeText(
                            'Enroll now',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/rightarrow.svg",
                          color: AppColors.primaryColor,
                          height: 14,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
