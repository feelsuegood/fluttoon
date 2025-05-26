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
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // only load items on the screen
                // print(index);
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => SizedBox(width: 20),
            );
          }
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
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
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
