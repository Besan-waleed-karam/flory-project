import 'package:flory/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Memoryframes extends StatefulWidget {


   Memoryframes({super.key});

  @override
  State<Memoryframes> createState() => _MemoryframesState();
}

class _MemoryframesState extends State<Memoryframes> {
  final List items = [
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image": "assets/images/pic10.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic5.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic6.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image": "assets/images/pic7.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic8.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic9.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic10.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic4.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image": "assets/images/pic5.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic6.jpg"
    },
    {
      "name":"Bloom",
      "price":"\$119.9",
      "image":"assets/images/pic7.jpg"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Padding(padding: const EdgeInsets.only(left: 30.0),
          child: Icon(Icons.menu,size: 40.sp),),

        actions: [
          SizedBox(width: 150.w,),
          Image.asset("assets/images/IMG_2006.PNG",width: 60.w,height: 60.h,fit: BoxFit.fill,),
          SizedBox(width: 30.w,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Memory Frames",style: TextStyle(fontFamily: "Libre",fontSize: 27.sp,color: Colors.black),)),
            SizedBox(height: 15.h,),
            Text("In every frame, a story gently blooms",style: TextStyle(fontSize: 24.sp,fontFamily: "Libre",color: TColors.primary),),
            SizedBox(height: 18.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search_outlined),
                  prefixIconColor: Color(0xff1c1c1c),
                  contentPadding: EdgeInsets.all(7.r),

                  hintText: "Search",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 20.sp,color: Colors.black),
                  filled: true,
                  fillColor: Colors.white

              ),),

             SizedBox(height: 30.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 19.h,
                    crossAxisSpacing: 32.w
                ),
                itemCount: items.length,
                itemBuilder: (context , index){
                  final item = items[index];
                  return Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.primary,width: 1.r),
                      borderRadius: BorderRadius.circular(18.r),
                      color:Colors.white,

                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 141.w,
                              height: 165.h,
                              child: ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                                child: Image.asset(item["image"],fit: BoxFit.fill,),
                          )),
                          //const SizedBox(height: 8,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(8.w, 0.h, 20.w, 0.h),
                                //color: Colors.purple,
                                child: Column(
                                  children: [
                                    Text(item["name"],style: TextStyle(color: Colors.grey,fontFamily: "Inter",fontSize: 15.sp),),
                                    Text(item["price"],style: TextStyle(color: Colors.black,fontFamily: "Inter",fontSize: 16.sp),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 30.w,),
                              Container(
                               alignment: Alignment.center,
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: TColors.primary,
                                  borderRadius: BorderRadius.circular(5.r)
                                ),
                                child: Icon(Icons.add,color: Colors.white,size: 15.sp,)),


                            ],
                          )


                        ],
                      ));
                },

              ),
            ),

          ],
        ),
      ),
    );
  }
}