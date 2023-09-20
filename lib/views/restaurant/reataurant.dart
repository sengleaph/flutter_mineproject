import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  late final ScrollController _scrollController= ScrollController();
//----------
  @override
  void initState() {
    super.initState();
    _scrollController
      .addListener(() {
        setState(() {
        });
      });
  }
//----------
  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.pink[700],
            ),
            leading: IconButton(onPressed: (){},icon: const Icon(Icons.arrow_back),),
            actions: [
              IconButton(onPressed: (){},icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(onPressed: (){},icon: const Icon(Icons.share_outlined)),
              IconButton(onPressed: (){},icon: const Icon(Icons.search_outlined)),
            ],
            iconTheme:const IconThemeData(
              size: 30,
            ),
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title:_isSliverAppBarExpanded? RichText(
                  text: const TextSpan(
                      children: [
                        TextSpan(text: "Dilivery\n",style: TextStyle(color: Colors.blue)),
                        TextSpan(text: "20 min"),
                      ]
                  ),
            ): SafeArea(
                child: Center(
                  child: Container(
                    color: Colors.blue, // set your color
                    child: Column(
                      children: [
                        const Row(
                          children: [Text("Logo")],
                        ),
                        const Text("data"), // set an icon or image
                        IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {}) // set your search bar setting
                      ],
                    ),
                  ),
                ),
              ),
              ),
            ),

          SliverToBoxAdapter(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: const Column(
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: const Column(
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: const Column(
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: const Column(
              ),
            ),
          ),
        ],
      )
    );
  }
}
