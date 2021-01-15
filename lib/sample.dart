import 'package:flutter/material.dart';

int _index = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        itemBuilder: (BuildContext context, int index) {
          return _buildCarousel(context, index);
        },
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
      // you may want to use an aspect ratio here for tablet support
      height: 250.0,
      child: PageView.builder(
        onPageChanged: (int index) => _index = index,
        // store this controller in a State to save the carousel scroll position
        controller: PageController(viewportFraction: 0.80),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    print('itemIndex.obs = $itemIndex');
    print('_index.obs = $_index');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Transform.scale(
        scale: itemIndex == _index ? 1 : 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
  }
}
