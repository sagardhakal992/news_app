import 'package:flutter/material.dart';
import 'package:shikhar_daily/pages/home/mainNewsList.dart';
import 'package:shikhar_daily/store/data.dart';

class SliverListHome extends StatelessWidget {
  const SliverListHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: homePageData.map((item){
        if(item.id==0){
          return mainNewsList(context:context);
        }
        else{
          return categoryNewsList(context: context, name:item.title,drawerCategory:item);
        }
      }).toList(),
    );
  }
}
