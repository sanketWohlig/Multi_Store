// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';

// import '../Models/ChatList.dart';
// // import 'package:http/http.dart';


// class ChatProvider extends ChangeNotifier {
//   List<String?> chats = [];
//   String? userquestion;

//   Response? answer;
//   // sendQuestion(String question, String? path) async {
//   //   print("$question in ");
//   //   chats.add(question);
//   //   chats.add('');
//   //   notifyListeners();
//   //   answer = await sendQestionGPT(path.toString(), question);
//   //   if (answer!.statusCode == 200) {
//   //     print('API CALLED');
//   //     final data = jsonDecode(answer!.body);
//   //     final myanswer = ChatsList.fromJson(data);
//   //     // print(myanswer.answer.toString());
//   //     // chats.add(myanswer.answer);
//   //     chats.last = myanswer.answer;
//   //     // print(chats.last!.answer);
//   //     notifyListeners();
//   //     // print(
//   //     //     'answer ${chats.last!.answer} and question ${chats.last!.question}');
//   //     return answer;
//   //   } else {
//   //     return 'Something went wrong';
//   //   }
//   // }

//   // Response? answer;
//   // getanswerGPT(String? path, String question) async {
//   //   answer = await getanswer(path.toString(), question);
//   //   return answer;
//   //   // notifyListeners();
//   // }

//   // getChatList(String? path) async {
//   //   chats = [];
//   //   final data = await getAllChats(path.toString());
//   //   print(data.length);
//   //   data.forEach(
//   //     (element) {
//   //       if (element.status == 'completed') {
//   //         chats.add(element.question);
//   //         chats.add(element.answer);
//   //       }
//   //       // print(chats[1]!.answer);
//   //       print('object');
//   //     },
//   //   );
//   //   notifyListeners();
//   // }

//   // addquestions(String question,String path) {
//   //   USerquestion = question;
//   //   getanswer(path,question);
//   //   notifyListeners();
//   // }

//   // addanswer(String answer) {
//   //   chats.add(answer);
//   //   notifyListeners();
//   // }
// }
