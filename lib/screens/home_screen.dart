import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_model.dart';
import 'package:fluttoon/seervices/api_service.dart';
import 'package:fluttoon/widgets/webtoon_widget.dart';

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
        foregroundColor: const Color.fromARGB(255, 117, 0, 200),
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Webtoons for Today",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
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
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
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
