import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/product/product_controller.dart';
import 'package:flutter_base/app/widgets/colors.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:get/get.dart';

class ProductView extends View {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends ViewState<ProductView, ProductController> {
  List<Widget> toListWidget(List<String> list) {
    return (list.map((item) => CategoryItem(item: item)).toList());
  }

  @override
  void initState() {
    super.initState();
    controller.fetchListProduct();
    controller.fetchListCategory();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Obx(() => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('Danh sách sản phẩm'),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Get.back(result: controller.listSelected);
                  }),
            ),
            body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Danh mục sản phẩm (${controller.listSortedProduct.length})',
                        style: TextStyle(color: ceruleanTwo),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: ceruleanTwo,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Wrap(
                                    children:
                                        toListWidget(controller.listCategory));
                              }).then((value) {
                                controller.sortByCategory();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.listSortedProduct.length,
                        itemBuilder: (context, index) {
                          return ProductItem(item: controller.listSortedProduct[index]);
                        },
                      ),
                    ),
                  ],
                ),
          ),
          loading(status: controller.status.value, context: context),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final ProductModel item;

  ProductItem({@required this.item});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  ProductController controller = Get.find();
  bool check = false;

  @override
  Widget build(BuildContext context) {

    void _testCheck() {
      if(controller.listSelected.contains(widget.item)){
        check = true;
      } else {
        check = false;
      }
    }

    _testCheck();

    return Card(
      color: check ? ceruleanTwo : Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(width: 1, color: ceruleanTwo)),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
        ),
        child: ListTile(
            onTap: () {
              if (controller.listSelected.contains(widget.item)) {
                controller.listSelected.removeWhere((item) => item == widget.item);
                setState(() {
                  check = false;
                });
              } else {
                controller.listSelected.add(widget.item);
                setState(() {
                  check = true;
                });
              }
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.item.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: check ? Colors.white : ceruleanTwo,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  widget.item.price.toString() + "đ",
                  style: TextStyle(
                    fontSize: 16,
                    color: check ? Colors.white : ceruleanTwo,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.info),
              color: check ? Colors.white : ceruleanTwo,
              iconSize: 25,
              onPressed: () {},
            )),
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String item;
  CategoryItem({@required this.item});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  ProductController controller = Get.find();
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    void _testCheck() {
      if(controller.listSort.contains(widget.item)){
        check = true;
      } else {
        check = false;
      }
    }

    _testCheck();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          // print(controller.listChecked.toList());
          // print('aaaaa + ${i.toString()}');
          // check = !check;
          // print('bbb + $check');
          //print(controller.listCategory.toList());

          if (controller.listSort.contains(widget.item)) {
            controller.listSort.removeWhere((item) => item == widget.item);
            setState(() {
              check = !check;
            });
          } else {
            controller.listSort.add(widget.item);
            setState(() {
              check = !check;
            });
          }

        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blue, width: 1.5),
            color: check ? ceruleanTwo : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              widget.item,
              maxLines: 1,
              style: new TextStyle(
                fontSize: 16,
                color: check ? Colors.white : ceruleanTwo,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
