import 'package:flutter/material.dart';
import 'package:money_app/db/category/category_db.dart';
import 'package:money_app/models/category/category_model.dart';
import 'package:money_app/screens/category/category_add_popup.dart';
import 'package:money_app/screens/category/screen_category.dart';
import 'package:money_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_app/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({ Key? key }) : super(key: key);
  

  static ValueNotifier<int> selectedIndexNotifier =ValueNotifier(0);

  final _pages=const[
    ScreenTransaction(),
    ScreenCategory()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('MONEY MANAGER'),
        centerTitle: true,
        ),
        
      bottomNavigationBar: MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: selectedIndexNotifier,
        builder:(BuildContext contex, int updatedIndex, _){
          return _pages[updatedIndex];
        } ,
        )),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(selectedIndexNotifier.value==0){
               print('ADD TRANSACTION');
            }else{
               print('ADD CATEGORY');
               showCategoryAddPopup(context);

               /* final _sample =CategoryModel(
                 id: DateTime.now().microsecondsSinceEpoch.toString(),
                 name: 'Travel',
                 type: CategoryType.expense,
        
                 );
                 CategoryDB().insertCategory(_sample) */;
            }
            
          },
          child: Icon(Icons.add),
        ),
      
    );
  }
}