import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 117, 0, 200),
        surfaceTintColor: Colors.transparent,
        title: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* give animation effec to thumb -> Hero
              Hero(
                tag: id,
                child: Container(
                  width: 250,
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
            ],
          ),
        ],
      ),
    );
  }
}
