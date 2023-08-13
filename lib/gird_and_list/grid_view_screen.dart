import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shagouf_project/gird_and_list/grid_view_details.dart';
import 'package:shagouf_project/gird_and_list/item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final List<Item> items = [
    const Item(
      id: 1,
      image:
          'https://img.freepik.com/premium-vector/tree-cartoon-illustration-isolated-white-background_338371-617.jpg',
      title: 'Tree',
    ),
    const Item(
      id: 2,
      image:
          'https://img.freepik.com/free-photo/red-white-cat-i-white-studio_155003-13189.jpg?w=900&t=st=1691944639~exp=1691945239~hmac=74393f8ea4b5fb6be71ffa65007f073a5d772ad6711e0c127bebb198de58dc9e',
      title: 'cat1',
    ),
    const Item(
      id: 3,
      image:
          'https://img.freepik.com/premium-vector/cute-baby-cat-with-big-eyes-pink-bow-kid-print_76639-129.jpg?w=1380',
      title: 'cat2',
    ),
  ];

  bool isList = true;
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(isList ? 'List View' : 'Grid View'),
        leading: IconButton(
          onPressed: () {
            setState(() {
              isList = !isList;
            });
          },
          icon: Icon(
            isList ? Icons.grid_view_outlined : Icons.view_list_sharp,
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => GridViewDetails(
                        items[itemIndex],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    items[itemIndex].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: const Duration(
                seconds: 2,
              ),
              autoPlayInterval: const Duration(
                seconds: 6,
              ),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: items.length,
            effect: WormEffect(
              dotColor: Colors.white.withOpacity(0.5),
              radius: 5,
              activeDotColor: Colors.white,
              spacing: 8,
            ),
          ),
          isList
              ? Expanded(
                  child: listItems(),
                )
              : Expanded(
                  child: gridItems(),
                ),
        ],
      ),
    );
  }

  Widget listItems() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => GridViewDetails(
                  items[index],
                ),
              ),
            );
          },
          child: Hero(
            tag: items[index].id,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(items[index].image),
            ),
          ),
        );
      },
    );
  }

  Widget gridItems() {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => GridViewDetails(
                  items[index],
                ),
              ),
            );
          },
          child: Hero(
            tag: items[index].id,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(items[index].image),
            ),
          ),
        );
      },
    );
  }
}
