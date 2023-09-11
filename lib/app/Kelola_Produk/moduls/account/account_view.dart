import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Center(child: Text('Account')),
      ),
      backgroundColor: Colors.blue[100],
      body: Stack(
        children: [
          SizedBox(height: context.height),
          Container(
            margin: Ei.only(l: 30, r: 30),
            width: 400,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1)),
            child: Column(
              mainAxisAlignment: Maa.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: Ei.only(b: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    child: LzImage(
                      'profile.jpeg',
                      radius: 50,
                      size: 100,
                    ),
                  ),
                ),
                Text(
                  'Wayan Naruto Uzumaki',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'narutouzumaki@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 220,
            left: 30,
            right: 30,
            child: Container(
              margin: Ei.only(l: 4, r: 4),
              width: context.width,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1)),
              child: Container(
                margin: Ei.only(l: 20, r: 20),
                child: Column(
                  mainAxisAlignment: Maa.spaceEvenly,
                  children: [
                    RowItem('Profile', Icons.person_outlined),
                    RowItem('About', Icons.info_outline),
                    RowItem('Privacy Policy', Icons.lock_outline),
                    RowItem('Settings', Icons.settings_outlined),
                    RowItem('Rate App', Icons.star_border_rounded),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                width: 250,
                margin: EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Warna latar belakang tombol (merah)
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String text;
  final IconData icon;

  RowItem(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Ei.sym(v: 5),
      padding: Ei.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
