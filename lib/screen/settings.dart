import 'package:flutter/material.dart';
import 'package:kudunews2/helper/category.dart';
import 'package:kudunews2/models/category_model.dart';
import 'package:kudunews2/screen/categorynews.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  List<CategoryModel> catmodel = category();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Preferences',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 28,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 1,
              width: width,
              color: Colors.grey[300],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourites',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            SizedBox(height: 30),
            Container(
                height: MediaQuery.of(context).size.width * 0.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: catmodel.length,
                    itemBuilder: (BuildContext context, int ind) {
                      return CatShowSettings(
                        name: catmodel[ind].categoryName,
                        imgurl: catmodel[ind].imageUrl,
                        icons: catmodel[ind].icons,
                      );
                    })),
            SizedBox(height: 50),
            Container(
              height: 1,
              width: width,
              color: Colors.grey[300],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.night_shelter),
                SizedBox(width: 5),
                Text('Darkmode'),
                Spacer(),
                ToggleButton()
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Icon(Icons.notifications),
                SizedBox(width: 5),
                Text('Help and Support'),
                Spacer(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class CatShowSettings extends StatelessWidget {
  final String imgurl;
  final String name;
  final IconData icons;
  CatShowSettings(
      {@required this.name, @required this.imgurl, @required this.icons});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => CategoryNews(category: name)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: size * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100],
            // border: Border.all(
            //   color: Colors.grey[300],
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icons,
                  color: Colors.grey[500],
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  var togglevalue = false.obs;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: togglevalue.value
            ? Colors.greenAccent[100]
            : Colors.redAccent[100].withOpacity(0.5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                //top: 3.0,
                left: togglevalue.value ? 30 : 0,
                right: togglevalue.value ? 0 : 30,
                child: InkWell(
                  onTap: () => togglevalue.value = !togglevalue.value,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: togglevalue.value
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 30,
                            key: UniqueKey(),
                          )
                        : Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                            size: 30,
                            key: UniqueKey(),
                          ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
