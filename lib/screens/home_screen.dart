import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_model.dart';
import 'package:fluttoon/seervices/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiServece.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    //* beginner ver - using stateful widget
    // print(webtoons);
    // print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        surfaceTintColor: Colors.transparent,
        title: Text("Webtoons for Today", style: TextStyle(fontSize: 24)),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //*for debug
            // return const Text("There is data");
            return Column(
              children: [
                SizedBox(height: 20),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        // only load items on the screen
        // print(index);
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
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
                webtoon.thumb,
                headers: const {'Referer': 'https://comic.naver.com'},
                //* doesn't work
                // headers: {
                //   "User-Agent":
                //       "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                // },
              ),
            ),
            SizedBox(height: 10),
            Text(webtoon.title, style: TextStyle(fontSize: 22)),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 40),
    );
    // return ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: snapshot.data!.length,
    //     itemBuilder: (context, index) {
    //*       // only load items on the screen
    //*      // print(index);
    //       var webtoon = snapshot.data![index];
    //       return Text(webtoon.title);
    //     },
    //   );
  }
}

//* beginner ver - using stateful widget
// class _HomeScreenState extends State<HomeScreen> {
  // List<WebtoonModel> webtoons = [];
  // bool isLoading = true;

  // void waitForWebtoons() async {
  //   webtoons = await ApiServece.getTodaysToons();
  //   isLoading = false;
  //*   // refresh the screen -> recommend to avoid using state
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   waitForWebtoons();
  // }
