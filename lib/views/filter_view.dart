import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internshala_assignment/constants/appcolors.dart';
import 'package:internshala_assignment/viewmodels/filter_VM.dart';
import 'package:internshala_assignment/widgets/filter_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          "Filters",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<FilterViewModel>(builder: (context, viewModel, child) {
        return Stack(
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryColor,
                  value: viewModel.isChecked,
                  onChanged: (value) {
                    viewModel.isChecked = value!;
                  },
                ),
                const AutoSizeText.rich(
                  TextSpan(
                    text: "As per my",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: " preferences",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Adaptive.h(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FilterWidget(
                                ontap: () {
                                  if (!viewModel.isChecked) {
                                    context.push('/profilefilter');
                                  } else {
                                    _showPopup(context);
                                  }
                                },
                                child: (viewModel.selectedProfiles.isNotEmpty)
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: viewModel.selectedProfiles
                                              .map((profile) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Chip(
                                                      label: Text(profile),
                                                      deleteIcon: Icon(
                                                        Icons.close,
                                                        size: 18,
                                                        color: Colors.white,
                                                      ),
                                                      onDeleted: () {
                                                        viewModel
                                                            .selectedProfiles
                                                            .remove(profile);
                                                        viewModel
                                                            .notifyListeners();
                                                      },
                                                      backgroundColor:
                                                          Color(0xff007BFF),
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      )
                                    : Container(),
                                title: "PROFILE",
                                subtitle: "Profile",
                              ),
                              SizedBox(height: 20),
                              FilterWidget(
                                child: (viewModel.selectedLocations.isNotEmpty)
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: viewModel.selectedLocations
                                              .map((location) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Chip(
                                                      label: Text(location),
                                                      deleteIcon: Icon(
                                                        Icons.close,
                                                        size: 18,
                                                        color: Colors.white,
                                                      ),
                                                      onDeleted: () {
                                                        viewModel
                                                            .selectedLocations
                                                            .remove(location);
                                                        viewModel
                                                            .notifyListeners();
                                                      },
                                                      backgroundColor:
                                                          Color(0xff007BFF),
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      )
                                    : Container(),
                                ontap: () {
                                  if (!viewModel.isChecked) {
                                    context.push('/locationfilter');
                                  } else {
                                    _showPopup(context);
                                  }
                                },
                                title: "CITY",
                                subtitle: "City",
                              ),
                              SizedBox(height: 20),
                              Text(
                                "MAXIMUM DURATION (IN MONTHS)",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6C757D),
                                ),
                              ),
                              SizedBox(height: 13),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<int>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select duration',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  value: viewModel.selectedDuration,
                                  items: [1, 2, 3, 4, 6, 12, 24, 36]
                                      .map((int value) => DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(
                                              value.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (newValue) {
                                    if (!viewModel.isChecked) {
                                      viewModel.selectedDuration = newValue;
                                    } else {
                                      _showPopup(context);
                                    }
                                  },
                                  selectedItemBuilder: (BuildContext context) {
                                    return [1, 2, 3, 4, 6, 12, 24, 36]
                                        .map<Widget>((int item) {
                                      return Container(
                                        alignment: Alignment.centerLeft,
                                        constraints:
                                            const BoxConstraints(minWidth: 100),
                                        child: Chip(
                                          deleteIcon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          onDeleted: () {
                                            viewModel.selectedDuration = null;
                                          },
                                          label: Text(
                                            '${item.toString()} months',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          backgroundColor: Color(0xff007BFF),
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }).toList();
                                  },
                                  iconStyleData: const IconStyleData(
                                    icon: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.chevron_down,
                                          size: 17,
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(
                                          width: 17,
                                        )
                                      ],
                                    ),
                                  ),
                                  buttonStyleData: ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (viewModel.isChecked)
                          Padding(
                            padding: EdgeInsets.only(top: Adaptive.h(0.5)),
                            child: GestureDetector(
                              onTap: () => _showPopup(context),
                              child: Container(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // context.go('/internship');
                          viewModel.clearAll();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 50),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          "Clear all",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 13),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/internship');
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 50),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0xff007BFF),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 25, right: 25, bottom: 20),
          child: Text(
            "Uncheck \"As per my preferences\" checkbox to search manually.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        );
      },
    );

    // Delay for 4 seconds and then close the bottom sheet
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context); // Dismiss the bottom sheet
    });
  }
}
