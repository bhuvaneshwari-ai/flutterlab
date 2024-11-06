import'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Responsive UI',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home:ResponsiveHomePage(),
      );
  }
}
class ResponsiveHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(  
        title:Text('Responsive UI Design'),
      ),
      body: LayoutBuilder(
        builder:(context,constraints){
          if(constraints.maxWidth>=1200){
            return DesktopLayout();
          }else if(constraints.maxWidth>800 &&
          constraints.maxWidth<=1200){
            return TabletLayout();
          }else{
            return MobileLayout();
          }
        },
      ),
bottomNavigationBar: Footer(),
    );
  }
}
class MobileLayout extends StatelessWidget{
   @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Header(),
        Expanded(child: CardGridView(crossAxisCount:2)),
      ],
    );
}
}
class TabletLayout extends StatelessWidget{
   @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Header(),
        Expanded(child: CardGridView(crossAxisCount:3)),
      ],
    );
}
}
class DesktopLayout extends StatelessWidget{
   @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Header(),
        Expanded(child: CardGridView(crossAxisCount:4)),
      ],
    );
}
}
class Header extends StatelessWidget{
   @override
  Widget build(BuildContext context){
    return Container(
      padding:EdgeInsets.all(16.0),
      color:Colors.blue,
      child: Center(
        child:Text(
          'this is BHUNA',
          style:TextStyle(fontSize: 64,color: Colors.black),
        ),
      ),
    );
  }
}
class CardGridView extends StatelessWidget{
  final int crossAxisCount;
  CardGridView({required this.crossAxisCount});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:crossAxisCount,
        crossAxisSpacing:10.0,
        mainAxisSpacing:10.0,
      ),
      padding:EdgeInsets.all(10.0),
      itemCount: 10,
      itemBuilder: (context,index){
        return Card(
          color:Colors.blueAccent,
          child: Center(
            child:Text(
              'Card $index',
              style: TextStyle(fontSize:64,color: Colors.black),
            ),
            ),
        );
      },
    );
  }
}
class Footer extends StatelessWidget{
   @override
  Widget build(BuildContext context){
    return Container(
      padding:EdgeInsets.all(16.0),
      color:Colors.blue,
      child: Center(
        child:Text(
          'this is BHUNA',
          style:TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}