import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Screens/product_detail_screen.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_bloc.dart';
import 'package:shopping_app/data/bloc/product_bloc/product_bloc.dart';
import 'package:shopping_app/data/bloc/product_bloc/product_event.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/data/model/products.dart';
import 'package:shopping_app/data/repository/banner_repository.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/cach_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/bloc/home_bloc/home_state.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

final _control = PageController();

class _Home_ScreenState extends State<Home_Screen> {
  IBannerRepository _bannerRepository = locator.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeRequestSuccessState) {
          return CustomScrollView(
            slivers: [
              AppBarr(),
              SearchBox(),
              state.bannerList.fold(((left) {
                return SliverToBoxAdapter(
                  child: Text(left),
                );
              }), ((right) {
                return bannerr(right);
              })),
              state.ProductList.fold(
                (left) => SliverToBoxAdapter(
                  child: Text(left),
                ),
                (right) => Product_widget(right),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('error'),
          );
        }
      })),
    );
  }

  Widget Product_widget(List<Products> products) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => BlocProvider(
                      create: (context) {
                        var bloc = ProductBloc();
                        bloc.add(ProductGetInitilzeData(products[index].id));
                        return bloc;
                      },
                      child: ProductDetailScreen(
                        index: index,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 185, 185, 185),
                      offset: Offset(1, 1),
                      blurRadius: 15,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 110.h),
                        child: SizedBox(
                          width: 200.w,
                          height: 150.h,
                          child: CachedImage(
                            radius: 15.r,
                            imageUrl: products[index].image,
                          ),
                        )),
                    Positioned(
                      top: 160.h,
                      left: 20.w,
                      child: Text(
                        products[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210.h,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      products[index].price.toString(),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: products[index].have_discount
                                            ? Colors.grey
                                            : Colors.black,
                                        decoration:
                                            products[index].have_discount
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                        decorationColor: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 7.w),
                                    if (products[index].have_discount)
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 6),
                                          child: Text(
                                            '% ${products[index].discount.toString()} ',
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
                                if (products[index].have_discount)
                                  Text(
                                    products[index]
                                        .priceWithdisconunt!
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: black.withOpacity(0.7),
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(11.r),
                              ),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 25.w,
                                color: Colors.white,
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
          },
          childCount: products.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 270,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }

  Widget bannerr(List<Banner_model> banner) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            child: PageView(
              controller: _control,
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(banner.length, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                      child: CachedImage(
                        imageUrl: banner[index].thumbnail,
                        banner: true,
                        radius: 10,
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _control,
            count: banner.length,
            effect: WormEffect(
              dotHeight: 11.h,
              dotWidth: 11.w,
              activeDotColor: const Color(0xffFF033E),
            ),
          ),
        ],
      ),
    );
  }

  Row banner_builder(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              'New Relase',
              style: TextStyle(
                color: black,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Force 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              alignment: Alignment.center,
              width: 90.w,
              height: 37.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: black,
              ),
              child: Text(
                'buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // RotationTransition(
        //   turns: AlwaysStoppedAnimation(-30 / 360),
        //   child: Image.asset(
        //     'images/${banners()[count].image!}',
        //     height: 210,
        //     width: 210,
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ],
    );
  }

  SliverToBoxAdapter SearchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15.w),
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 15.w),
                    const Text(
                      'Search your shoes',
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 187, 187),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 1,
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: black,
                ),
                child: Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                  size: 27.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter AppBarr() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'images/nike2_i.png',
                ),
              ),
            ),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage('images/p3.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
