import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shikhar_daily/model/post.dart';

Widget categoryNewsCard({required BuildContext context,required NewsModel newsModel,required int index,required String title}){


  return GestureDetector(
    onTap: (){
      Get.toNamed("/detail",arguments:newsModel);
    },
    child: Container(

       width: Get.width,


       padding: const EdgeInsets.all(10),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Expanded(child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text(newsModel.title,style: const TextStyle(
                 fontSize:20,

                 fontWeight: FontWeight.bold
               ),),
               Text(newsModel.description.substring(3),
                 maxLines: 4,
                 style: const TextStyle(
                 fontSize:16,
                 fontWeight: FontWeight.w300
               ),)
             ],
           ),flex: 8,),
           const Expanded(child: SizedBox(),flex: 1,),
           Expanded(
             flex:7,
             child: Column(
             children: [
               Container(
                 height: 100,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: NetworkImage(newsModel.imageUrl!),
                     fit: BoxFit.fitWidth
                   )
                 ),
               ),
               IconButton(onPressed:()async{

                         final box = context.findRenderObject() as RenderBox?;
              await Share.share(newsModel.link,
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                    }, icon:const Icon(Icons.share_outlined))
             ],
           ),)
         ],
       ),
       margin: const EdgeInsets.only(bottom:10),
     ),
  );
}