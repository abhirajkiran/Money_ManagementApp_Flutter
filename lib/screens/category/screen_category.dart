import 'package:flutter/material.dart';
import 'package:money_app/db/category/category_db.dart';
import 'package:money_app/screens/category/expance_category_list.dart';
import 'package:money_app/screens/category/income_category_list.dart';
import 'package:money_app/screens/home/widgets/bottom_navigation.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({ Key? key }) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>with SingleTickerProviderStateMixin{

late TabController _tabController;

@override
  void initState() {
  _tabController=TabController(length: 2,vsync: this);
  CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: [
          Tab(text: 'INCOME'),
          Tab(text: 'EXPANCE')
        ]),
        Expanded(
          child: TabBarView(
             controller: _tabController,
            children: [
               IncomeCategoryList(),
               ExpanceCategoryList()
            ]),
        )
      ],
    );
  }
}