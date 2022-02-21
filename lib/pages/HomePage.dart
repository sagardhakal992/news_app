import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shikhar_daily/custom_widgets/custom_drawer.dart';
import 'package:shikhar_daily/custom_widgets/sliverListHome.dart';
import 'package:shikhar_daily/store/newsStore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isDrawerOpen;
  double? xOffset;
  double? yOffset;
  double? scale;
  bool? isDragging;

  NewsController newsController=Get.put(NewsController());


  @override
  void initState() {
    drawerClosed();
    super.initState();

  }

  void drawerClosed(){
    setState(() {
      scale=1;
    isDrawerOpen=false;
    xOffset=0;
    yOffset=0;
    isDragging=false;
    });
  }
  void drawerOpened(){
    setState(() {
     scale=0.87;
    isDrawerOpen=true;
    xOffset=230;
    yOffset=76;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            customDrawer(),
            _buildHomePage()

          ],
        ),
      ),
    );
  }

  _buildHomePage() {
    return GestureDetector(
      onTap: drawerClosed,
      onHorizontalDragStart: (details){
       isDragging=true;
      },
      onHorizontalDragUpdate: (detail){
        if(!isDragging!) return;
        if(detail.delta.dx>5){
          if(detail.globalPosition.dx<50){
            drawerOpened();
          }
        }
        else if(detail.delta.dx< -5){
          if(detail.globalPosition.dx>150){
            drawerClosed();
          }
        }
        isDragging=false;
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset!,yOffset!, 0)..scale(scale!),
        duration: const Duration(milliseconds:200),
        child: AbsorbPointer(
          absorbing:isDrawerOpen!,
          child: DefaultTabController(
          length: 8,
          child: Scaffold(
       backgroundColor: Colors.white,
            appBar:isDrawerOpen! ?AppBar(
              toolbarHeight: 10,
              elevation: 0,
              backgroundColor: const Color(0xFF8E5103),
            ): AppBar(

              backgroundColor: Colors.white,
              centerTitle: true,
              toolbarHeight: 50,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu,color: Colors.black87,),
                onPressed: drawerOpened,
              ),
              title: const Text('SHIKHAR DAILY',style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
              ),
              bottom: const TabBar(
                 isScrollable:true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.black,
                labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                tabs: [
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                  Tab(text: "Home"),
                ],
              ),
            ),
            body: const SliverListHome()
          ),
        ),
        ),
      ),
    );
  }
}
