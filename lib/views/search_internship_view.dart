import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:internshala_assignment/constants/appcolors.dart';
import 'package:internshala_assignment/viewmodels/intership_VM.dart';
import 'package:internshala_assignment/viewmodels/filter_VM.dart'; // Import the FilterViewModel
import 'package:internshala_assignment/widgets/offer_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InternshipView extends StatefulWidget {
  @override
  _InternshipViewState createState() => _InternshipViewState();
}

class _InternshipViewState extends State<InternshipView> {
  @override
  void initState() {
    super.initState();
    // Fetch internships when the view is initialized
    Future.microtask(() {
      Provider.of<InternshipViewModel>(context, listen: false)
          .fetchInternships();
    });
  }

  String img = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/search.svg",
                height: 24,
              ),
              SizedBox(width: 12),
              SvgPicture.asset(
                "assets/bookmark.svg",
                height: 22,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.notifications_outlined,
                size: 23,
                color: Color(0xff333333),
              ),
              SizedBox(width: 12),
              SvgPicture.asset(
                "assets/chat.svg",
                height: 16,
              ),
              SizedBox(width: 18),
            ],
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {},
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          "Internships",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer2<InternshipViewModel, FilterViewModel>(
        builder: (context, internshipViewModel, filterViewModel, child) {
          if (internshipViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (internshipViewModel.internshipResponse == null) {
            return Center(child: Text('No data available'));
          }

          // Apply filters from FilterViewModel
          var filteredInternships = internshipViewModel
              .internshipResponse!.internshipsMeta.values
              .where((internship) {
            bool matchesInternship = filterViewModel.selectedProfiles.isEmpty ||
                filterViewModel.selectedProfiles.contains(internship.title);
            bool matchesLocation = filterViewModel.selectedLocations.isEmpty ||
                internship.locationNames.any((location) =>
                    filterViewModel.selectedLocations.contains(location));
            bool matchesDuration = filterViewModel.selectedDuration == null ||
                internship.duration == filterViewModel.selectedDuration;
            return matchesInternship && matchesLocation && matchesDuration;
          }).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigate to filters page
                          context.push('/filters');
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          width: Adaptive.w(23),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_alt_outlined,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${filteredInternships.length} total internships',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1.3,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: filteredInternships.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CourseOfferWidget(),
                              Text(
                                'No internships found',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  filterViewModel.clearAll();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                child: Text(
                                  'Clear all filters',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Column(
                            children: [
                              Divider(
                                height: 1,
                                thickness: 1.3,
                                color: Colors.grey[100],
                              ),
                              Divider(
                                height: 10,
                                thickness: 10,
                                color: Colors.grey[100],
                              ),
                              Divider(
                                height: 1,
                                thickness: 1.3,
                                color: Colors.grey[100],
                              ),
                            ],
                          ),
                          itemCount: filteredInternships.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  CourseOfferWidget(),
                                ],
                              );
                            }
                            final internship = filteredInternships[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey[200]!,
                                    width: 1.3,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey[200]!,
                                    width: 1.3,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Adaptive.w(35),
                                      constraints:
                                          BoxConstraints(maxWidth: 150),
                                      padding: EdgeInsets.only(
                                          top: 4, bottom: 4, right: 5, left: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey[400]!, width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/growth.svg",
                                            height: 10,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "Actively Hiring",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        internship.title ?? 'No Title',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      trailing: img == ""
                                          ? Container(
                                              width: 60,
                                              color: Color(0xffD9D9D9),
                                            )
                                          : Image.asset(""),
                                      subtitle: Text(
                                        internship.companyName ?? 'No Company',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff8A8A8A)),
                                      ),
                                      onTap: () {
                                        // Navigate to details page or perform action
                                      },
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/location.svg",
                                          height: 15,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          internship.locationNames.toString() ==
                                                  '[]'
                                              ? "Location not mentioned"
                                              : internship.locationNames
                                                  .join(', '),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Adaptive.h(1.5)),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/starting.svg",
                                              height: 15.5,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              "${internship.startDate}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 20),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/calender.svg",
                                              height: 19,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              "${internship.duration}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Adaptive.h(1.5)),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/stipend.svg",
                                          height: 10,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          internship.stipend['salary'] == null
                                              ? "Stipend not mentioned"
                                              : "${internship.stipend['salary']}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Adaptive.h(1.5)),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                            color: Color(0xffECECEC), width: 1),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child:
                                          Text("${internship.employmentType}"),
                                    ),
                                    SizedBox(height: 19),
                                    Divider(
                                      height: 0.4,
                                      thickness: 0.6,
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View details",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                          ),
                                          child: Text(
                                            "Apply now",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
