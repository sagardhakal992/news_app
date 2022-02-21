
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shikhar_daily/model/drawerCategory.dart';
import 'package:shikhar_daily/model/post.dart';
import 'package:shikhar_daily/store/data.dart';

class NewsController extends GetxController{
  var mainNews=[].obs;
  var newsCategory=[].obs;
  var mainCategoryNewsList={}.obs;
  var oneCategoryNewsList=[].obs;
  var pageId=1;
  var mainPageId=1;
  @override
  void onInit() {
    super.onInit();

    loadNewsCategory();
    for (var element in homePageData) {
      if(element.id==0){
        loadMainNews();
      }
      else{
        loadMainCategoryNewsListasync(element:element);
      }
    }
  }

  void loadNewsCategory()async{

   final url = Uri.parse("https://shikharnews.com/wp-json/wp/v2/categories");

  final response = await http.get(url);
  if (response.statusCode == 200) {
    var catList=[];
    final jsonResponse = convert.jsonDecode(response.body);
    jsonResponse.forEach((item){

      catList.add(DrawerCategory(title: item['name'],id:item["id"]));

    });

    newsCategory.value=catList;
  } else {

  }
  }

  void loadMainNews()async{
    final url = Uri.parse("https://shikharnews.com/wp-json/wp/v2/posts?_embed");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    var newList=[];
    jsonResponse.forEach(
        (item){

           newList.add(NewsModel.fromJson(item));
        }
    );
    mainNews.value=newList;
  } else {

  }
  }



  void loadMainCategoryNewsListasync({required DrawerCategory element})async{
    final url = Uri.parse("https://shikharnews.com/wp-json/wp/v2/posts?_embed&&categories=${element.id.toString()}");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    var newList=[];
    jsonResponse.forEach(
        (item){

           newList.add(NewsModel.fromJson(item));
        }
    );
   mainCategoryNewsList[element.title]=newList;

  } else {

  }
  }




  void loadOneCategoryNewsCategory({required int id})async{
   oneCategoryNewsList.clear();
   pageId=1;
   final url = Uri.parse("https://shikharnews.com/wp-json/wp/v2/posts?_embed&&categories=${id.toString()}");

  final response = await http.get(url);
  if (response.statusCode == 200) {
    var catList=[];
    final jsonResponse = convert.jsonDecode(response.body);
    jsonResponse.forEach((item){

      catList.add(NewsModel.fromJson(item));

    });

    oneCategoryNewsList.value=catList;

  } else {

  }
  }


   void updateOneCategoryNewsCategory({required int id})async{

   pageId++;

   final url = Uri.parse("https://shikharnews.com/wp-json/wp/v2/posts?_embed&&categories=${id.toString()}&&page=${pageId.toString()}");

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    jsonResponse.forEach((item){
      oneCategoryNewsList.add(NewsModel.fromJson(item));

    });


  } else {

  }
  }


  void updateMainNews()async{

   mainPageId++;

   final url = Uri.parse("https://shikharnews.com/wp-json/wp/v2/posts?_embed&&page=${pageId.toString()}");

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    jsonResponse.forEach((item){
      mainNews.add(NewsModel.fromJson(item));

    });


  } else {

  }
  }


}