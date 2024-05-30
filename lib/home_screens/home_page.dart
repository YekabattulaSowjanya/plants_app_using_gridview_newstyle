import 'package:flutter/material.dart';
import 'package:plants_app_using_new_widgets/home_screens/straggered_grid_list.dart';
import 'package:provider/provider.dart';
import '../provider/search_plants_info.dart';

class StraggeredHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text(
                      'Search Products',
                      style: TextStyle(fontSize: 20),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        //padding: const EdgeInsets.only(top: 8.0),
                        height: 48,
                        width: 10,
                        decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(40)),
                        child: TextField(
                          key: const Key('search_text_key'),
                          cursorColor: Colors.grey,
                          onChanged: (query) {
                            Provider.of<SearchPlantsProvider>(context,
                                    listen: false)
                                .searchPlants(query);
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 5),
                              fillColor: Colors.white,
                              filled: true,
                              border: //InputBorder.none,
                                  OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              prefixIcon: Container(
                                padding: const EdgeInsets.only(
                                    bottom: 15, left: 15, right: 15, top: 13),
                                width: 18,
                                child: const Icon(Icons.search),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(left: 13),
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 18, left: 13, right: 13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          width: 25,
                          child: const Icon(Icons.add_chart_outlined)),
                    ),
                  ],
                ),
              ),
              const StraggeredGridList(),
            ],
          ),
        ),

      ),
    );
  }
}
