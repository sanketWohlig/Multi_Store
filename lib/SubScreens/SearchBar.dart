import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Hero(
                      tag: 'search',
                      child: TextField(
                        scrollPadding: const EdgeInsets.all(0),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          iconColor: const Color(0xFFF5F5F5),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0),
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFF9C9C9C), width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 0,
                            borderSide: const BorderSide(
                                color: Color(0xFF9C9C9C), width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Search for news",
                          hintStyle: const TextStyle(color: Color(0xFF8A8A8A)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const Divider(
            //   height: 1,
            //   color: Colors.black,
            //   thickness: 0.4,
            // ),
            const CustomListView()
          ],
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  final String? trailing;
  const CustomListView({super.key, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: trailing != null
                    ? Text(
                        trailing.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF858585)),
                      )
                    : const Text(''),
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.woolha.com/media/2020/03/eevee.png',
                  ),
                  radius: 65 / 2,
                ),
                title: const Text(
                  'Melbourne’s MCG to host the most awaited boxing day pink ball test match.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                subtitle: const Text(
                  'one week ago',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                ),
              );
            }),
      ),
    );
  }
}
