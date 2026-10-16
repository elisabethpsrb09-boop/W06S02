
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pam_w6s2/screen/sayur_page.dart';
import 'package:pam_w6s2/widget/navbar_widget.dart';
 
class Home extends StatefulWidget {
  const Home({super.key});
 
  @override
  State<Home> createState() => _HomeState();
}
 
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
 
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
 
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Pembelian Sayur',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0.sp,
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0.h),
            Text(
              'List Sayur parsob',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0.h),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: const Color(0xFFC88D67),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.only(right: 24),
              unselectedLabelColor: const Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text(
                    'Sayur Box',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 20.0.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sayur Slice',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 20.0.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sayur Mayur',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 20.0.sp),
                  ),
                ),
              ],
            ),
            // Expanded: TabBarView otomatis mengisi sisa layar,
            // tanpa hitung tinggi manual (penyebab error sebelumnya).
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SayurPage(),
                  SayurPage(),
                  SayurPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
