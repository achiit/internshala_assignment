import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internshala_assignment/constants/appcolors.dart';
import 'package:internshala_assignment/viewmodels/filter_VM.dart';
import 'package:internshala_assignment/viewmodels/intership_VM.dart';
import 'package:provider/provider.dart';

class LocationFilterView extends StatefulWidget {
  const LocationFilterView({super.key});

  @override
  _LocationFilterViewState createState() => _LocationFilterViewState();
}

class _LocationFilterViewState extends State<LocationFilterView> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> _selectedInternships = [];

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
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              context.read<FilterViewModel>().updateSelectedLocation(_selectedInternships);
              context.pop(); // Navigate back to the FilterView
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
                fontSize: 16,
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
          "City",
          style: TextStyle(
            fontSize: 20,
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

          // Flatten and deduplicate the location names
          final locations = viewModel.internshipResponse!.internshipsMeta.values
              .where((internship) => internship.locationNames != null)
              .expand((internship) => internship.locationNames!)
              .toSet()
              .toList();

          final filteredLocations = locations.where((location) {
            return location.toLowerCase().contains(_searchQuery.toLowerCase());
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
                    labelText: "Search city",
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
                      children: _selectedInternships.map((location) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            label: Text(location,
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
                                _selectedInternships.remove(location);
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
                  itemCount: filteredLocations.length,
                  itemBuilder: (context, index) {
                    final location = filteredLocations[index];
                    final isSelected = _selectedInternships.contains(location);

                    return ListTile(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedInternships.remove(location);
                          } else {
                            _selectedInternships.add(location);
                          }
                        });
                      },
                      leading: Checkbox(
                        activeColor: Color(0xff008de0),
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _selectedInternships.add(location);
                            } else {
                              _selectedInternships.remove(location);
                            }
                          });
                        },
                      ),
                      title: Text(location),
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
