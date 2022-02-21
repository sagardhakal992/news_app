
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shikhar_daily/custom_widgets/categoryNewsCard.dart';
import 'package:shikhar_daily/custom_widgets/mainNews.dart';
import 'package:shikhar_daily/model/drawerCategory.dart';
import 'package:shikhar_daily/pages/categoryPage.dart';
import 'package:shikhar_daily/store/newsStore.dart';

Widget mainNewsList({required BuildContext context}){

  return GetX<NewsController>(builder: (controller){
    return SliverList(delegate:SliverChildBuilderDelegate(
      (contexts,index){
        if(index==controller.mainNews.length-1){
          return Column(
            children: [
              mainNewsCard(newsModel: controller.mainNews[index], context: context),
              TextButton(onPressed:controller.updateMainNews, child:const Text("More"))
            ],
          );
        }
        return mainNewsCard(newsModel: controller.mainNews[index], context: context);
      },
    childCount:controller.mainNews.length
  ),

  );
  });
}



Widget categoryNewsList({required BuildContext context,required String name,required DrawerCategory drawerCategory}){

  return GetX<NewsController>(builder: (controller){
    return controller.mainCategoryNewsList.isEmpty?SliverToBoxAdapter(child: Container(
      height: 100,
      child: Center(child: const CircularProgressIndicator()),
    ),
    ):
    SliverList(delegate:SliverChildBuilderDelegate(
      (contexts,index){
        if(index==0){
          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryPage(drawerCategory: drawerCategory,)));
                  },
                  child: Container(
                     padding: const EdgeInsets.only(left: 10),
                      margin: const EdgeInsets.only(top: 20),
                      height:30,
                      child: Row(
                        children: [
                          Text(name,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,

                  ),),
                          const Icon(Icons.keyboard_arrow_right)
                        ],
                      )),
                ),
        categoryNewsCard(newsModel: controller.mainCategoryNewsList[name][index], context: context,index:index,title:name)
              ],
            ),
          );
        }
        return categoryNewsCard(newsModel: controller.mainCategoryNewsList[name][index], context: context,index:index,title:name);
      },
    childCount:controller.mainCategoryNewsList[name]!=null?controller.mainCategoryNewsList[name].length:0
  ),

  )

    ;
  });
}

