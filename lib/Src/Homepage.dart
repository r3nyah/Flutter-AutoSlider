import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sliderwidget/Src/Card.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<String> cardList = [
    'One',
    'Two',
    'Three',
    'Fourth',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
  ];

  List<T> map<T>(List list,Function handler){
    List<T> result = [];
    for (var i = 0; i<list.length; i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Auto Slider',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index,reason){
                    setState((){
                      _currentIndex = index;
                    });
                  }
                ),
                items: cardList.map((item){
                  return ItemCard(title: item.toString());
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList,(index,url){
                  return Container(
                    width: _currentIndex == index?30:10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 2
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentIndex == index?Colors.deepOrange:Colors.deepOrange.withOpacity(0.3)
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
