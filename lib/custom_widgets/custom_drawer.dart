import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shikhar_daily/pages/categoryPage.dart';
import 'package:shikhar_daily/store/newsStore.dart';

Widget customDrawer(){

  return SizedBox(
    height: Get.height,
    width: Get.width,
    child: Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: const Color(0xFFF4F2F2),
        ),
        Positioned(top: 0,left: 0,right: 0,
          child: Container(
            decoration: const BoxDecoration(

                color: Color(0xFF8E5103),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,2),
                  spreadRadius: 5,
                  blurRadius: 3
                )
              ]

            ),

            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: Container(
            height: 60,


            decoration: const BoxDecoration(

              color: Color(0xFF8E5103),
              image:DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.fitHeight,

            ),
        ),
          ),),),
        Positioned(
          top: 83,
          child: Container(
            height: Get.height-83,
            width: Get.width,
            padding: const EdgeInsets.all(20),

            child: GetX<NewsController>(
              builder: (controller){
                return controller.newsCategory.isEmpty?const Center(child: CircularProgressIndicator(),):
                    ListView.builder(
              itemCount: controller.newsCategory.length,
              itemBuilder: (context,index)=> SizedBox(
              height: 50,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryPage(drawerCategory: controller.newsCategory[index])));
                },
                child: Text(controller.newsCategory[index].title,style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ));
              },
            ),
          ),
        )
      ],
    ),
  );
}