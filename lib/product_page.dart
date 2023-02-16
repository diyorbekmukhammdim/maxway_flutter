
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maxway_flutter/service.dart';
import 'Model.dart';
import 'detail_screen.dart';
import 'di.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

enum _Status { loading, success, fail }

const url = "https://cdn.delever.uz/delever/";

class _MainScreenState extends State<MainScreen> {
  var _status = _Status.loading;
  final _api = get.get<MaxWayApi>();
  late MaxWay _response;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      _response = await _api.getData();
      print("ssss");
      _status = _Status.success;
      setState(() {});
    } catch (e) {
      print("eee");
      _status = _Status.fail;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 6,
        title: const Text("Max Way"),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: Builder(builder: (context) {
        switch (_status) {
          case _Status.loading:
            return const Center(child: CircularProgressIndicator());
            break;
          case _Status.success:
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _response.pageProps.categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(_response.pageProps.categories[index].title.uz),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _corusel(_response.pageProps.banners),
                ),
                _products(_response.pageProps.categories)
              ],
            );
            break;
          case _Status.fail:
            return const CircularProgressIndicator();
            break;
        }
      }),
    );
  }
}

Widget _corusel(List<Banners> banners) {
  return CarouselSlider(
    items: banners
        .map((e) => Builder(builder: (context) {
      return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Image.network(e.image!));
    }))
        .toList(),
    options: CarouselOptions(
      height: 150,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget _products(List<Category> category) {

  return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: category.length, (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                category[index].title.uz,
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            _items(category[index].products),
          ],
        );
      }));
}

Widget _items(List<Product> products) {
  double h = 100;
  if(products.length<=2){
    h =h*2.5;
  }else if(products.length<=4){
    h = h*4;
  }else if(products.length<=6){
    h = h*6;
  }else if(products.length<=8){
    h = h*8;
  }else if(products.length<=10){
    h = h*10;
  }
  return SizedBox(
    height: h,
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: _item(products[index]),
          onTap: () {
            itemClicked(products[index], context);
          },
        );
        // return Image.network(url+products[index].image);
      },
    ),
  );

  // return SliverGrid(
  //
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //     delegate: SliverChildBuilderDelegate(
  //             childCount: products.length,
  //             (context, index) {
  //       return Image.network(url + products[index].image);
  //     }),
  //   );
}

Widget _item(
    Product product,
    ) {
  return Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(4),
    decoration:  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)),
    image: DecorationImage(image:  CachedNetworkImageProvider(url + product.image))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Text("")),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Text(
            product.title.uz,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        )
      ],
    ),
  );
}

void itemClicked(Product product, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(
        product: product,
      ),
    ),
  );
}


