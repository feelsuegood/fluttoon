import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_detail_model.dart';
import 'package:fluttoon/models/webtoon_episode_model.dart';
import 'package:fluttoon/seervices/api_service.dart';
import 'package:fluttoon/widgets/episode_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// change this to stateFulWidget
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //* constructor
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    // widget == DetailScreen class
    webtoon = ApiServece.getToonById(widget.id);
    episodes = ApiServece.getLatestEpisodsById(widget.id);
  }

  // onButtonTap() async {
  //*   // final url = Uri.parse("https://google.com");
  //*   // await launchUrl(url);
  //   await launchUrlString("https://google.com");
  // }

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
          widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* give animation effec to thumb -> Hero
                  Hero(
                    tag: widget.id,
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
                        widget.thumb,
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
              SizedBox(height: 40),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return Text(
                    "..................................................",
                  );
                },
              ),
              SizedBox(height: 25),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //* Used when the number of ListView data is unknown,
                    //* in this case, the data being loaded is exactly 10, so use Column
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(episode: episode, webtoonId: widget.id),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
