
import 'package:dashboard_ecomerce/controllers/subcategory_controller.dart';
import 'package:dashboard_ecomerce/models/subcategory.dart';
import 'package:flutter/material.dart';

class SubcategoryWidget extends StatefulWidget {
  const SubcategoryWidget({super.key});

  @override
  State<SubcategoryWidget> createState() => _SubcategoryWidgetState();
}

class _SubcategoryWidgetState extends State<SubcategoryWidget> {
    // A future that will hold the list of categories once loaded from API
    late Future<List<Subcategory>> futureCategories;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = SubcategoryController().loadSubCategories();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCategories, 
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(),
                );
            }
            else if (snapshot.hasError){
                return Center(
                    child: Text('Lỗi ${snapshot.error}'),
                );
            }
            else if(!snapshot.hasData|| snapshot.data!.isEmpty) {
                return Center(
                    child: Text('Không có loại sản phẩm con nào'),
                );
            }
            else{
                final subcategories = snapshot.data!;
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount:  subcategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8
                    ), 
                    itemBuilder: (context, index) {
                        final subcategory = subcategories[index];
                        return Column(
                            children: [
                                Image.network(subcategory.image, height: 100, width:  100,),
                                Text(subcategory.subCategoryName),
                            ],
                        );
                    });
            }

        }
    );
  }
}