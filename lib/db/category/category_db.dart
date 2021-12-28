import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:money_app/models/category/category_model.dart';
import 'package:money_app/screens/category/income_category_list.dart';

const CATEGORY_DB_NAME ='category-database';

abstract class CategoryDbFunctions{
Future <List<CategoryModel>> getCategories();
 Future<void> insertCategory(CategoryModel value);
 Future<void>deleteCategory(String CategoryID);

}

class CategoryDB implements CategoryDbFunctions{

CategoryDB.internal();
static CategoryDB instance=CategoryDB.internal();

factory CategoryDB(){
  return instance;
}





ValueNotifier<List<CategoryModel>>incomeCategoryListListener=ValueNotifier([]);
ValueNotifier<List<CategoryModel>>expenseCategoryListListener=ValueNotifier([]);


  @override
  Future<void>  insertCategory(CategoryModel value)async {
   final  _categoryDB=await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME); 
  await _categoryDB.put(value.id,value);
  refreshUI();

    
  }

  @override
  Future<List<CategoryModel>> getCategories()async
   {
    final  _categoryDB=await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME); 
    return _categoryDB.values.toList();
   
   
  }

  Future<void> refreshUI()async{
    final _allCategories=await getCategories();
     incomeCategoryListListener.value.clear();
     expenseCategoryListListener.value.clear();
   await Future.forEach(_allCategories, (CategoryModel category){
if (category.type==CategoryType.income) {
      incomeCategoryListListener.value.add(category);
        }else{
          expenseCategoryListListener.value.add(category);
        }
        incomeCategoryListListener.notifyListeners();
        expenseCategoryListListener.notifyListeners();
    });
  }

  @override
  Future<void> deleteCategory(String CategoryID)async {
  final _categoryDB=await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME) ;
  _categoryDB.delete(CategoryID);
  refreshUI(); 
  
  }



}