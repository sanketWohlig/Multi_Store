import 'package:flutter/material.dart';
// import 'package:news_app/Api_Services/chats.dart';
// import 'package:news_app/MainScreen/NewsFeed.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

import '../Provider/ChatProvider.dart';
import '../Provider/NewsProvider.dart';
import '../Widgets/ThreeDot.dart';

// import '../utilities/clip.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          // onPressed: () => Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const FeedPage(),
          //     ),
          //     (route) => false)),
        ),
        title: Hero(
          tag: 'headline',
          child: Consumer<NewsProvider>(
            builder: ((context, value, child) {
              final id = value.currentindex;
              return Text(
                value.newsdata![id].headline.toString(),
                style: const TextStyle(
                    // color: Color(0xFF4B9CD6),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                maxLines: 2,
              );
            }),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/chat-backgroung.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Chats(),
            ChatBox(),
          ],
        ),
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
    final news = Provider.of<NewsProvider>(context, listen: false).newsdata;
    id = news![index].id;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Container(
          color: Colors.black87,
          child: Padding(
            padding: EdgeInsets.only(
                top: 8.0,
                bottom: isKeyboardVisible ? 8.0 : 25.0,
                left: 5.0,
                right: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    controller: question,
                    scrollPadding: const EdgeInsets.all(0),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide: const BorderSide(
                            color: Color(0xFF9C9C9C), width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Curious to know more? Ask Us',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          if (question.text != '') {
                            // print(question.text);
                            setid();
                            Provider.of<ChatProvider>(context, listen: false)
                                .sendQuestion(
                                    question.text, '/chats/addQnA/$id');
                            FocusManager.instance.primaryFocus?.unfocus();
                            question.clear();
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                'Please Enter Question',
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(milliseconds: 500),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
          ),
        );
      },
    );
  }
}

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  var id;
  @override
  void initState() {
    loadChats();
    super.initState();
  }

  loadChats() async {
    final index =
        Provider.of<NewsProvider>(context, listen: false).currentindex;

    final news = Provider.of<NewsProvider>(context, listen: false).newsdata;
    id = news![index].id;
    Provider.of<ChatProvider>(context, listen: false)
        .getChatList('/chats/getChatsperUser/$id');
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        controller: _scrollController,
        physics: const ScrollPhysics(),
        child: Consumer<ChatProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Consumer<NewsProvider>(builder: (context, value, child) {
                  final id = value.currentindex;
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.85),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFEBF2F5)),
                        child: Text(
                          value.newsdata![id].summary.toString(),
                          style: const TextStyle(height: 1.2, fontSize: 15),
                        ),
                      ),
                    ),
                  );
                }),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.chats.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Align(
                          alignment: index.isOdd
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.85),
                            decoration: BoxDecoration(
                              color: index.isOdd
                                  ? const Color(0xFFEBF2F5)
                                  : const Color(0xFFD7E9F1),
                              borderRadius: BorderRadius.only(
                                topLeft: index.isOdd
                                    ? const Radius.circular(0)
                                    : const Radius.circular(15),
                                bottomLeft: const Radius.circular(15),
                                bottomRight: const Radius.circular(15),
                                topRight: index.isOdd
                                    ? const Radius.circular(15)
                                    : const Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: value.chats[index].toString() == ''
                                      ? JumpingDots(
                                          numberOfDots: 3,
                                        )
                                      : Text(
                                          value.chats[index]!.toString(),
                                        ),
                                )),
                          ),
                        ),
                      );
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
