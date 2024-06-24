import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internshala_assignment/constants/appcolors.dart';
import 'package:internshala_assignment/viewmodels/filter_VM.dart';
import 'package:internshala_assignment/viewmodels/intership_VM.dart';
import 'package:provider/provider.dart';

class ProfileFilterView extends StatefulWidget {
  const ProfileFilterView({super.key});

  @override
  _ProfileFilterViewState createState() => _ProfileFilterViewState();
}

class _ProfileFilterViewState extends State<ProfileFilterView> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> _selectedInternships = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              _searchController.clear();
              setState(() {
                _searchQuery = '';
                _selectedInternships.clear();
              });
            },
            child: Text(
              "Clear all",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              log('Selected Internships: $_selectedInternships');
              context
                  .read<FilterViewModel>()
                  .updateSelectedProfiles(_selectedInternships);
              context.push('/filters'); // Navigate back to the FilterView
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(width: 4),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<InternshipViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.internshipResponse == null) {
            return Center(child: Text('No data available'));
          }

          final internships = viewModel
              .internshipResponse!.internshipsMeta.values
              .where((internship) => internship.title != null)
              .map((internship) => internship.title!)
              .toSet();
          final filteredInternships = internships.where((title) {
            return title.toLowerCase().contains(_searchQuery.toLowerCase());
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: "Search profile",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              if (_selectedInternships.isNotEmpty)
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _selectedInternships.map((title) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text(title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            deleteIcon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                            backgroundColor: Color(0xff008de0),
                            onDeleted: () {
                              setState(() {
                                _selectedInternships.remove(title);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredInternships.length,
                  itemBuilder: (context, index) {
                    final internship = filteredInternships[index];
                    final title = filteredInternships[index];
                    var isSelected = _selectedInternships.contains(title);
                    bool isselected = false;

                    return ListTile(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedInternships.remove(title);
                          } else {
                            _selectedInternships.add(title);
                          }
                        });
                      },
                      leading: Checkbox(
                        activeColor: Color(0xff008de0),
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _selectedInternships.add(title);
                            } else {
                              _selectedInternships.remove(title);
                            }
                          });
                        },
                      ),
                      title: Text(
                        title ?? 'No Title',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
