import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shikhar_daily/model/post.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
  NewsModel newsModel=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(onPressed:()async{

              final box = context.findRenderObject() as RenderBox?;
              await Share.share(newsModel.link,
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
          }, icon:const Icon(Icons.share_outlined,size:25,))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              margin: const EdgeInsets.only(bottom: 10),
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(newsModel.imageUrl!),
                  fit: BoxFit.fill
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(newsModel.title,style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),),
            ),
            Html(
              data:newsModel.description,
              style:{
                "p":Style(fontSize:FontSize.em(1.5),lineHeight: LineHeight.em(1.2))
              }),

          ],
        ),
      ),
    );
  }
}
