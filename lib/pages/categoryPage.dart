import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shikhar_daily/custom_widgets/mainNews.dart';
import 'package:shikhar_daily/model/drawerCategory.dart';
import 'package:shikhar_daily/store/newsStore.dart';

 class CategoryPage extends StatefulWidget {

   DrawerCategory drawerCategory;
  CategoryPage({Key? key,required  this.drawerCategory}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late NewsController newsController;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsController=Get.find<NewsController>()..loadOneCategoryNewsCategory(id: widget.drawerCategory.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,

        title: Text(widget.drawerCategory.title,style: const TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: GetX<NewsController>(builder: (controller){
        return controller.oneCategoryNewsList.isEmpty?const Center(child: CircularProgressIndicator(
          color: Colors.black,
        ),):
            ListView.builder(
                itemCount: controller.oneCategoryNewsList.length,
                itemBuilder: (contexts,index){
                  if(index==controller.oneCategoryNewsList.length-1){
                    return Column(
                      children: [
                        mainNewsCard(newsModel: controller.oneCategoryNewsList[index], context: context),
                        TextButton(onPressed: (){
                          controller.updateOneCategoryNewsCategory(id: widget.drawerCategory.id);
                        }, child:const Text("Show More"))
                      ],
                    );
                  }
              return mainNewsCard(newsModel: controller.oneCategoryNewsList[index], context: context);
            });
      }),

    );
  }
}
