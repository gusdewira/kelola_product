import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazyui/lazyui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: Ei.only(t: 50),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: Ei.only(l: 45, r: 30),
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: Caa.start,
                children: [
                  Text(
                    'HOMEProduct',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'the best choice in choosing a shopping place',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: Ei.only(l: 45),
              child: Row(
                children: [
                  Text(
                    'Data By Product',
                    style: Gfont.bold.black.fsize(30),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(
                    La.arrowRight,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            CarouselSlider(
              items: [
                Container(
                  width: context.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100],
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
                Container(
                  width: context.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100],
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
                Container(
                  width: context.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100],
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
              ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                enableInfiniteScroll: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: Ei.only(),
                child: LzSlideIndicator(
                  activeColor: Colors.black,
                  active: 0,
                  length: 3,
                  size: (int i) => [i == 0 ? 25 : 10, 10],
                ))
          ],
        ),
      ),
    );
  }
}
