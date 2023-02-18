import 'package:flutter/material.dart';
// import 'package:news_app/Api_Services/getAllNews.dart';
import 'package:provider/provider.dart';
import '../Models/News.dart';
import '../Provider/NewsProvider.dart';
import '../SubScreens/ChatPage.dart';
import '../Widgets/CustomAppBar.dart';
import '../Widgets/CustomPageView.dart';
import '../Widgets/Drawer/Drawer.dart';

bool showappbar = true;

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<newsResponse>? newsdata;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getnews();
    super.initState();
  }

  getnews() async {
    // await Provider.of<NewsProvider>(context, listen: false).setindex(0);
    await Provider.of<NewsProvider>(context, listen: false).getallnews();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() => Future.delayed(Duration(seconds: 2), () {});
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        drawer: const MyDrawer(),
        appBar: showappbar
            ? const MyAppBar(
                title: 'Feed',
              )
            : null,
        body: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                // User swiped Left
                print('Left Swipe');
              } else if (details.primaryVelocity! > 0) {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            // onHorizontalDragEnd: (s) => _scaffoldKey.currentState!.openDrawer(),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {
                showappbar = !showappbar;
              });
            },
            child: RefreshIndicator(
                onRefresh: _refresh, child: const CustomPageView())),
        bottomSheet: ChatBox(),
      ),
    );
  }
}

class ChatBox extends StatefulWidget {
  ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  TextEditingController question = TextEditingController();
  var id;
  setid() async {
    final index =
        Provider.of<NewsProvider>(context, listen: false).currentindex;
    print(index);
    // index ?? 0;
    final news = Provider.of<NewsProvider>(context, listen: false).newsdata;
    // print(news);
    id = news![index].id;
    // getAllChats('/chats/getChatsperUser/$id');
  }

  @override
  void initState() {
    super.initState();
    setid();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 25.0, left: 15.0, right: 15.0),
      child: Row(
        children: [
          Expanded(
            // Icon
            child: TextField(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              },
              controller: question,
              showCursor: true,
              readOnly: true,
              scrollPadding: const EdgeInsets.all(0),
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide:
                      const BorderSide(color: Color(0xFF9C9C9C), width: 1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Curious to know more? ask me here!',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ClipOval(
              child: Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    if (question.text != '') {
                      // print('hey ${question.text}');
                      // setid();
                      // Provider.of<ChatProvider>(context, listen: false)
                      //     .sendQuestion(question.text, '/chats/addQnA/$id');
                      // FocusManager.instance.primaryFocus?.unfocus();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ChatPage()));
                      // question.clear();

                      // question.dispose();
                    } else {
                      const snackBar = SnackBar(
                        content: Text(
                          'Please Enter Question',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(milliseconds: 500),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const SizedBox(
                    width: 32,
                    height: 32,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
