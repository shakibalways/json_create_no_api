import 'package:flutter/material.dart';
import 'package:product_show/controller/categor_call.dart';
import 'package:product_show/model/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Products> list = [];

  getList() async {
    list = await ProductListService.productListService();
    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Just For You",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
              GridView.builder(
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.60),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                              "${list[index].image}",
                              height: 150,
                              width: 150,
                              fit: BoxFit.fitHeight,
                            )),
                            Text(
                              maxLines: 1,
                              list[index].name.toString(),
                              style: TextStyle(),
                            ),
                            Text(list[index].productId.toString()),
                            Text(list[index].category.toString()),
                            Text('\$${list[index].price}'),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
