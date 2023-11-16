import 'package:flutter/material.dart';
import 'package:prov/provider/favourite_provider.dart';
import 'package:prov/screen/favourite/my_favourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {

  const  FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteItemScreen()));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
        centerTitle: true,
        title: Text('Favourite App'),
      ),
      body: Column(
        children: [
               Expanded(
                 child: ListView.builder(
                   itemCount: 100,
                     itemBuilder: (context, index){
                       return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                         return ListTile(
                           onTap: (){
                             
                             if(value.selectedItem.contains(index)){
                               value.removeItem(index);
                             }else{
                               value.addItem(index);
                             }
                           },
                           title: Text('Item'+index.toString()),
                           trailing: Icon(
                               value.selectedItem.contains(index)?Icons.favorite
                                   :
                               Icons.favorite_border_outlined),
                         );
                       });
                     }),
               )
        ],
      ),
    );
  }
}
