import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

class PorfileSearch extends StatelessWidget {
  final TextEditingController controller;
  final List<String> suggestions;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSuggestionSelected;
  final void Function()? onTap;
  final String hintText;

  PorfileSearch({
    required this.hintText,
    required this.onTap,
    required this.controller,
    required this.suggestions,
    required this.onChanged,
    required this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(
                Icons.search,
              ),
              suffix: InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.clear,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          suggestions.isNotEmpty
              ? Container(
                  height: suggestions.length * 50.0,
                  constraints: BoxConstraints(maxHeight: 250.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              suggestions[index],
                              style: TextStyle(color: Colors.black87),
                            ),
                            onTap: () {
                              onSuggestionSelected(suggestions[index]);
                            },
                          ),
                          if (index < suggestions.length - 1)
                            Divider(height: 1),
                        ],
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
