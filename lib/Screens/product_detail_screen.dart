import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Screens/home.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/data/bloc/product_bloc/product_bloc.dart';
import 'package:shopping_app/data/bloc/product_bloc/product_state.dart';
import 'package:shopping_app/data/model/product_detail_model.dart';
import 'package:shopping_app/util/cach_image.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatefulWidget {
  int index;
  ProductDetailScreen({super.key, required this.index});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

int indexx = 0;
int indexxx = 0;
List size = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51];

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Text(
      //       'pice',
      //       style: TextStyle(
      //         color: black,
      //         fontSize: 19.sp,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     Container(
      //       width: 190.w,
      //       height: 50.h,
      //       decoration: BoxDecoration(
      //         color: black,
      //         borderRadius: BorderRadius.circular(10.r),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           const Icon(
      //             Icons.shopping_cart_outlined,
      //             color: Colors.white,
      //           ),
      //           Text(
      //             'Add To Cart',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 15.sp,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.black));
            } else if (state is ProductRequestSuccessState) {
              return state.ProductdetailList.fold(
                (left) {
                  return const Text('error');
                },
                ((productdetailList) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomScrollView(
                        slivers: [
                          MainImage(context, productdetailList),
                          body(productdetailList),
                        ],
                      ),
                      price(productdetailList)
                    ],
                  );
                }),
              );
            } else {
              return const Center(
                child: Text('error'),
              );
            }
          },
        ),
      ),
    );
  }

  Container price(List<Product_detail> product) {
    return Container(
      height: 50.h,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  product[0].priceWithdisconunt!.toStringAsFixed(2),
                  style: TextStyle(
                    color: black,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                if (product[0].have_discount)
                  Text(
                    product[0].price.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color:
                          product[0].have_discount ? Colors.grey : Colors.black,
                      decoration: product[0].have_discount
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.grey,
                    ),
                  ),
                SizedBox(width: 8.w),
                if (product[0].have_discount)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                      child: Text(
                        '% ${product[0].discount.toString()} ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: 190.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding body(List<Product_detail> product) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              product[0].name,
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                SizedBox(width: 6.w),
                Text(
                  product[0].rank.toString(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 70.h,
              child: ListView.builder(
                itemCount: product[0].images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 24.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          indexx = index;
                        });
                      },
                      child: Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.w,
                            color: indexx == index ? black : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: CachedImage(
                          imageUrl: product[0].imageUrl[index],
                          radius: 8.r,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              'Select Size',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 35.h,
              child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 11.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          indexxx = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2.w,
                            color: indexxx == index ? black : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          '${size[index]}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Explain',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(bottom: 20.w),
              child: Text(
                product[0].explain,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar MainImage(BuildContext context, List<Product_detail> product) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: CachedImage(
          imageUrl: product[0].imageUrl[indexx],
          radius: 8.r,
        ),
      ),
      expandedHeight: 400.h,
      backgroundColor: backgroundColor,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Container(
          height: 20.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70.r),
              topRight: Radius.circular(70.r),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 7.h),
              Container(
                height: 4.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.r),
                    topRight: Radius.circular(70.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(250, 250, 250, 0.6),
            radius: 18.r,
            child: Icon(
              Icons.favorite_border,
              color: black,
              size: 25.w,
            ),
          ),
        ),
      ],
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (BuildContext context) => const Home_Screen(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(right: 300.w),
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(250, 250, 250, 0.6),
            radius: 18.r,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25.w,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    indexx = 0;
    indexxx = 0;
    super.deactivate();
  }
}
