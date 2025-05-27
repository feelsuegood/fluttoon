import 'package:flutter/material.dart';
import 'package:fluttoon/screens/datail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // get react from a user -> GestureDetector
    return GestureDetector(
      onTap: () {
        // navigator gives animation effect like changing screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            //* give animation effec to thumb -> Hero
            Hero(
              tag: id,
              child: Container(
                width: 350,
                //* remeber when you try border radious
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // how far shadow is
                      blurRadius: 15,
                      // choose where is the sun
                      offset: Offset(10, 15),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Image.network(
                  thumb,
                  headers: const {'Referer': 'https://comic.naver.com'},
                  //* doesn't work
                  // headers: {
                  //   "User-Agent":
                  //       "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  // },
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              title,
              style: GoogleFonts.nanumGothic(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
              ),
              // style: TextStyle(
              //   fontSize: 30,
              //   fontWeight: FontWeight.w600,
              //   letterSpacing: -1,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
