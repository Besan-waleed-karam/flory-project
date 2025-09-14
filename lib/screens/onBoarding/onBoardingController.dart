import 'package:flory/screens/onBoarding/welcomScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; //تحول أي متغير عادي إلى متغير تفاعلي (Reactive variable)، يعني لما تتغير قيمته، يتم إعلام الواجهات (Widgets) أو أي شيء يراقبه بالتغيير.


  // Update current Index when page scroll
  void updatePageIndicator(index)=> currentPageIndex.value = index;

  // Jump to the specific dot selected
  void dotClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update index and go to the next page
  void nextPage(){
    if(currentPageIndex.value ==2){
      final storage = GetStorage();
      if(kDebugMode){
        print("==================Get Storage Next Button===================");
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);
      if(kDebugMode){
        print("==================Get Storage Next Button===================");
        print(storage.read('IsFirstTime'));
      }
      Get.to(Welcomescreen());
    } else{
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  // update current index and go to the last page
  void skipPage(){
    Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_)=> Welcomescreen()));
  }

}