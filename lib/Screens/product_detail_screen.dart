import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Screens/home.dart';
import 'package:shopping_app/constants/colors.dart';

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
    // List get_images = [
    //   banners()[widget.index].image!,
    //   banners()[widget.index].image1!,
    //   banners()[widget.index].image2!,
    //   banners()[widget.index].image3!,
    // ];

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'pice',
              style: TextStyle(
                color: black,
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
              ),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: const FlexibleSpaceBar(
                  // background: Image.asset(
                  //   'images/${get_images[indexx]}',
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              expandedHeight: 400,
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
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'name',
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
                          '4.3',
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
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(left: index == 0 ? 0 : 24.w),
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
                                    color:
                                        indexx == index ? black : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                  // image: DecorationImage(
                                  //   image: AssetImage(
                                  //     'images/${get_images[index]}',
                                  //   ),
                                  //   fit: BoxFit.cover,
                                  // ),
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
                                    color:
                                        indexxx == index ? black : Colors.grey,
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
                        "Get in the Queue. Get the goods.Create or sign in to your free Nike Member account for a chance to buy this product the moment it's releasedThe Air Jordan 1 Mid brings full-court style and premium comfort to an iconic look. Its Air-Sole unit cushions play on the hardwood, while the padded collar gives you a supportive feel.Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity",
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
            ),
          ],
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
