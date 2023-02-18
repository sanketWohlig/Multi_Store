import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:news_app/Provider/NewsProvider.dart';
// import 'package:news_app/Widgets/ThreeDot.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../Provider/NewsProvider.dart';
import '../utilities/transform.dart';
import 'Transfomer.dart';

import 'package:path_provider/path_provider.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsdata = Provider.of<NewsProvider>(context).newsdata;
    if (newsdata == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (newsdata.isEmpty) {
      return const Center(
        child: Text('No Data Found'),
      );
    } else {
      return TransformerPageView(
        onPageChanged: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
          Provider.of<NewsProvider>(context, listen: false).setindex(value);
          print(value);
        },
        // scrollDirection: Axis.vertical,
        // pageSnapping: true,
        transformer: DeepthPageTransformer(),
        itemCount: newsdata.length,
        itemBuilder: ((context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(children: [
                  NewsImage(
                    imageurl: newsdata[index].image.toString(),
                    headline: newsdata[index].headline.toString(),
                    newsid: newsdata[index].id.toString(),
                  ),
                  NewsContext(
                    index: index,
                    heading: newsdata[index].headline,
                    title: newsdata[index].summary,
                  ),
                ]),
              ),
            ],
          );
        }),
      );
    }
  }
}

class NewsImage extends StatelessWidget {
  final String? imageurl;
  final String? headline;
  final String? newsid;
  const NewsImage(
      {super.key, required this.imageurl, required this.headline, this.newsid});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 309,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(imageurl.toString()),
                opacity: 0.8,
                // fit: BoxFit.cover
              )),
          child: Center(
            child: Image.network(
              imageurl.toString(),
              // height: 309,
              width: MediaQuery.of(context).size.width,
              // fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
      imageIcons(Icons.share, 30, 10, () async {
        if (Platform.isAndroid) {
          var url = imageurl;
          var response = await get(Uri.parse(url!));
          final documentDirectory = (await getExternalStorageDirectory())!.path;
          File imgFile = File('$documentDirectory/flutter.png');
          imgFile.writeAsBytesSync(response.bodyBytes);

          Share.shareFiles(
            ['$documentDirectory/flutter.png'],
            subject: 'URL conversion + Share',
            text: '$headline + https://dev.askus.news',
          );
        } else {
          Share.share(
            'Hey! Checkout the Share Files repo',
            subject: 'URL conversion + Share',
          );
        }
      }),
      imageIcons(Icons.bookmark_add_outlined, 30, 58, () async {
        // await context.read<NewsProvider>().addAllBookmarks(newsid.toString());
      }),
    ]);
  }

  Widget imageIcons(
      IconData? icon, double bottom, double right, VoidCallback onpressed) {
    return Positioned(
      bottom: bottom,
      right: right,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: onpressed,
          icon: Icon(icon, color: const Color(0xFF325568)),
        ),
      ),
    );
  }
}

class NewsContext extends StatelessWidget {
  final int index;
  final String? heading;
  final String? title;
  const NewsContext(
      {super.key,
      required this.index,
      required this.heading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 289.0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21.0, bottom: 5.0),
                child: Hero(
                  tag: 'headline',
                  child: Text(
                    heading.toString(),
                    style: const TextStyle(
                        // color: Color(0xFF4B9CD6),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Hero(
                tag: 'news_inshort',
                child: Text(
                  title.toString(),
                  maxLines: 10,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
