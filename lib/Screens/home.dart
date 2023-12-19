import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Screens/product_detail_screen.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/data/repository/banner_repository.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/cach_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          child: CustomScrollView(
        slivers: [
          AppBarr(),
          SearchBox(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductDetailScreen(
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 110.h),
                            child: Image.asset(
                              'images/${index + 1}.webp',
                              height: 200,
                              width: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 155.h,
                            left: 20.w,
                            child: Text(
                              'name',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'pice',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: black.withOpacity(0.7),
                                    ),
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(11.r),
                                    ),
                                    child: const Icon(
                                      Icons.shopping_cart_outlined,
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
                childCount: 4,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      )),
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
                      child: CachedImage(imageUrl: banner[index].thumbnail),
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
