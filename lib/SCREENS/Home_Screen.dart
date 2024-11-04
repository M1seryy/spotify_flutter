import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spotify/API/api_request.dart';
import 'package:flutter_spotify/API/models/songModel.dart';
import 'package:flutter_spotify/components/albumBlock.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<SongItem> api_res = [];
  final _searchController = TextEditingController();

  Future<void> checkApi() async {
    final apiData;
    final responce = await fetchSongs(_searchController.text);
    apiData = responce;
    // print(apiData[0].name);
    setState(() {
      api_res = apiData;
    });
    _searchController.clear();
  }

  void initState() {
    // TODO: implement initState
    checkApi();
    // print(api_res);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 70, left: 14, right: 14),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          hintText: 'Artists, songs, or podcasts',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white),
                    ),
                  ),
                  IconButton(
                      onPressed: () => {checkApi()},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      )),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Albums of Arttist",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SingleChildScrollView(
                child: Container(
                    height: 600,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Кількість колонок
                        crossAxisSpacing: 8.0, // Відстань між колонками
                        mainAxisSpacing: 8.0, // Відстань між рядами
                      ),
                      itemCount: api_res.length, // Кількість елементів у масиві
                      itemBuilder: (context, index) {
                        return Albumblock(
                          wallpaper:
                              api_res.length > 1 ? api_res[index].coverArt : "",
                          name: api_res.length > 1 ? api_res[index].name : "",
                          id: api_res.length > 1 ? api_res[index].id : "",
                        );
                      },
                    )),
              ),
            ],
          )),
    );
  }
}
