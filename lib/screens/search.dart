import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/colors.dart';
import '../utils/helpers/helper_functions.dart';
import '../utils/theme/custom_themes/appbar_theme.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [
    'Golden wedding Memory Frame',
    'Memory Frames',
    'Golden wedding Memory Frame',
    'Memory Frames',

  ];
  List<String> searchResults = [];
  bool isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      if (isSearching) {
        // In a real app, you would fetch actual search results here
        searchResults = [
          '$query result 1',
          '$query result 2',
          '$query result 3'
        ];
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      isSearching = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ?TAppbarTheme.darkAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
              backgroundColor: TColors.primary40,
              radius: 40.r,
              child:Icon(Icons.search,size: 40.sp,color: Colors.white,),

            ),
            SizedBox(width: 30.w),

          ]) :TAppbarTheme.lightAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Icons.search,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),

          ]) ,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:30.h,),
            TextFormField(

              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search_outlined,size: 28.sp,),
                  prefixIconColor: Color(0xff1c1c1c),
                  contentPadding: EdgeInsets.all(5.r),
                  hintText: "Search",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 20.sp,color: Colors.black),
                  filled: true,
                  fillColor: dark ? Colors.white.withOpacity(0.5): Colors.white

              ),),
            SizedBox(height: 20.h,),
            Text("Search History",style: TextStyle(fontFamily: "Inter",fontSize: 20.sp,color: Colors.black),),

            Expanded(
              child: isSearching
                  ? ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.search,size: 25.sp,color:Color(0xFFB2ADAD),),
                    title: Text(searchResults[index],style: TextStyle(fontSize: 15.sp,color: Color(0x80000000),fontFamily: "Inter"),),
                    onTap: () {
                      // Handle search result tap
                    },
                  );
                },
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchHistory.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.history,size: 25.sp,color:Color(0xFFB2ADAD),),
                          title: Text(searchHistory[index],style: TextStyle(fontSize: 15.sp,color: dark ? Colors.white : Color(0x80000000),fontFamily: "Inter"),),
                          onTap: () {
                            // Re-run the search when history item is tapped
                            _searchController.text = searchHistory[index];
                            _performSearch(searchHistory[index]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],


        ),
      ),
    );
  }
}