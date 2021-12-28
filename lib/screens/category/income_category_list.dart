import 'package:flutter/material.dart';
import 'package:money_app/db/category/category_db.dart';
import 'package:money_app/models/category/category_model.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
       builder: (BuildContext ctx, List<CategoryModel>newList, Widget?_){
         return ListView.separated(
      itemBuilder:(ctx,index){

        final category=newList[index];
        return ListTile(
          title: Text(category.name),
          trailing: IconButton(onPressed: (){
            CategoryDB.instance.deleteCategory(category.id);
          }, icon:Icon(Icons.delete)),
        );
      } ,
      separatorBuilder:(ctx,index){
        return SizedBox(height: 10,);
      } ,
      itemCount: newList.length,
      
    );
       });
  }
}