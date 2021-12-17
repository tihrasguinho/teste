import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test/app/modules/web/web_constants.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _photos = ValueNotifier<List<dynamic>>([]);

  List<dynamic> get photos => _photos.value;
  void addPhotos(List<dynamic> list) => _photos.value = list;

  void getImages(String query) async {
    final dio = Dio();

    try {
      final res = await dio.get(
        '$baseUrl/search?query=$query&orientation=square&per_page=16',
        options: Options(headers: {'Authorization': apiKey}),
      );

      final list = res.data['photos'] as List;

      addPhotos(list
          .map((e) => ({
                'original': e['src']['original'],
                'large': e['src']['large'],
                'small': e['src']['small'],
                'url': e['url'],
              }))
          .toList());
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    getImages('nature');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web GridView'),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              'Nature',
              'Movies',
              'Music',
              'Art',
              'Internet',
              'Happy',
            ]
                .map(
                  (e) => PopupMenuItem<String>(
                    child: Text(e),
                    onTap: () => getImages(e.toLowerCase()),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth <= 600;
          final isTablet = !isMobile && constraints.maxWidth <= 850;

          return Center(
            child: SizedBox(
              width: 1024,
              child: ValueListenableBuilder(
                valueListenable: _photos,
                builder: (context, value, child) {
                  return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile
                          ? 2
                          : isTablet
                              ? 3
                              : 4,
                    ),
                    children: photos
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              asuka.showDialog(
                                builder: (_) {
                                  return Dialog(
                                    clipBehavior: Clip.antiAlias,
                                    backgroundColor: Colors.transparent,
                                    child: Stack(
                                      children: [
                                        Image.network(e['large']),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: TextButton(
                                            onPressed: () => launch(e['url']),
                                            child: Text(
                                              'Fotos fornecidas pelo Pexels',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                e['large'],
                                fit: BoxFit.cover,
                              ),
                              elevation: 5,
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
