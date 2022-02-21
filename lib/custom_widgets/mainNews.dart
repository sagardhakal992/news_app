import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shikhar_daily/model/post.dart';




Widget mainNewsCard({required NewsModel newsModel,required BuildContext context})
{

  return GestureDetector(
    onTap: (){
      Get.toNamed("/detail",arguments:newsModel);
    },
    child: Container(
      color: Colors.white,
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15),

      child: Column(
        children: [
          Image.network(newsModel.imageUrl!,height: 300,width: Get.width,fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 10,top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child:
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(newsModel.title,
                      maxLines: 2,
                      style: const TextStyle(fontSize:23,overflow: TextOverflow.ellipsis),),
                    Text(newsModel.description.substring(3),
                      maxLines: 3,
                      style: const TextStyle(fontSize:19,overflow: TextOverflow.ellipsis),)

                  ],
                )
                ),
                SizedBox(
                  width: 50,
                  height: 120,
                  child: Center(
                    child: IconButton(icon: const Icon(Icons.share_outlined,size: 30,color: Colors.black,),
                      onPressed: ()async{
                         final box = context.findRenderObject() as RenderBox?;
              await Share.share(newsModel.link,
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                    },),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}