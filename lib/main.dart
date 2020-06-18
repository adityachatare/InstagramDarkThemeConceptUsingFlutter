import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //backgroundColor: Color(0xff272936),
      theme: ThemeData(
        primarySwatch:Colors.blue
        
      ),
     // debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272936),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children:<Widget>[
              CustomHeader(),
              NavStory(),
              Post(),
            ],
          ),
          
          NavBar(),
        ],
        )
    );
  }
}
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        IgnorePointer(
          child: Container(
            height:100,
            margin: EdgeInsets.only(bottom:0),
            width:MediaQuery.of(context).size.width,
            decoration:BoxDecoration(
              
              gradient:LinearGradient(
              begin:Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff3d3f50),
                Color(0xff3d3f50).withOpacity(0.01),
              ]  
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: BottomBarClipper(),
        child:Container(
          height: 105,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff3d3f50),
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.home,
                  size: 28,
                  color: Colors.white
                ),
                Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(bottom:0),
                  decoration: BoxDecoration(
                    gradient:LinearGradient(
                      begin:Alignment.bottomCenter,
                      end:Alignment.topCenter,
                      colors:[
                        Colors.orange.shade400.withOpacity(0.6),
                        Colors.pink
                      ],

                    ),
                    boxShadow: [BoxShadow(
                      color:Colors.deepOrangeAccent.shade100.withOpacity(0.3),
                      offset: Offset(0,10),
                      blurRadius: 20,
                    )],
                    shape: BoxShape.circle,
                  ),
                  child:FittedBox(
                  child: Text('+',style:TextStyle(fontWeight:FontWeight.w200,color: Colors.white)),
                ),),
                Icon(
                  Icons.favorite_border,
                  size:28,
                  color: Colors.white
                ),
                Icon(
                  Icons.perm_identity,
                  size: 28,
                  color: Colors.white
                )
              ],
            ),
            ),
        ),
        )
      ],
    );
  }
}
class BottomBarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size)
  {
    Path path = Path();
      var sw = size.width;
      var sh = size.height;
      path.moveTo(0, sh*0.35);
      path.lineTo(sw * 0.3, sh * 0.35);
      path.cubicTo(sw * 0.4, sh * 0.35, sw * 0.4, 0, sw * 0.5, 0);
      path.cubicTo(sw * 0.6, 0, sw * 0.6, sh * 0.35, sw * 0.7, sh * 0.35);
      path.lineTo(sw, sh * 0.35);
      path.lineTo(sw, sh);
      path.lineTo(0, sh);
      path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
}
class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      
      decoration: BoxDecoration(
        //borderRadius:BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
        color: Color(0xff3d3f50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal:10),
          child:Row(children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom:0),
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/1.png',width: 35,)
            )),
            Expanded(
              child: Center(
                child: Image.asset('assets/2.png'),
              )),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Image.asset('assets/live.png',width: 35,),
                  Image.asset('assets/dm.png',width: 35,)
                ],))],))
      ],),
    );
  }
}
class NavStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //border:Border.all(width: 3.0),
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
        color: Color(0xff3d3f50),
      ),
      child: Container(
        decoration: BoxDecoration(
        //border:Border.all(width: 3.0),
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
        color: Color(0xff3d3f50),
        //gradient: LinearGradient(end: Alignment.bottomLeft,begin: Alignment.bottomRight,colors: [Colors.orange.shade400,Colors.pink]),
      ),
        child: Padding(padding: EdgeInsets.all(8),
          child: Stack(
            children:<Widget>[
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:35,
                    backgroundColor:Colors.blue.shade400,
                    child: CircleAvatar(
                      radius:30,
                      
                      backgroundImage: AssetImage('assets/5.jpg'),
                      backgroundColor:Colors.blueAccent.withOpacity(0.5),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:35,
                    backgroundColor:Colors.orange.shade400,
                       child: CircleAvatar(
                      radius:30,
                      backgroundColor:Colors.grey[300],
                      backgroundImage: AssetImage('assets/unnamed.webp'),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:35,
                   backgroundColor:Colors.orange.shade400,
                     child: CircleAvatar(
                      radius:30,
                      backgroundImage: AssetImage('assets/4.png'),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:35,
                    backgroundColor:Colors.orange.shade400,
                     child: CircleAvatar(
                      radius:30,
                      backgroundImage: AssetImage('assets/7.png'),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:35,
                    backgroundColor:Colors.orange.shade400,
                     child: CircleAvatar(
                      radius:30,
                      backgroundImage: AssetImage('assets/3.png'),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:35,
                    backgroundColor:Colors.orange.shade400,
                     child: CircleAvatar(
                      radius:30,
                      backgroundColor:Colors.grey[300],
                    ),
                  ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
       
      children: [
        
        Container(
          margin:EdgeInsets.all(15),
          padding:EdgeInsets.all(15),
          height:450,
          decoration:BoxDecoration(
            color: Color(0xff3d3f50),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                CircleAvatar(
                  radius:18,
                  backgroundImage: AssetImage('assets/5.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("imadichatare",style: TextStyle(fontWeight:FontWeight.w500,color: Colors.white),),
                Spacer(),
                Icon(Icons.more_horiz,color: Colors.white,)
              ],
            ),
            Container(
              height:330,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                image: DecorationImage(image: new AssetImage('assets/4.jpg'),fit: BoxFit.cover)
              )
            ),
            Row(children: [
              Icon(Icons.favorite,color: Colors.redAccent,),
              Text("50",style: TextStyle(fontWeight:FontWeight.w500,color: Colors.white),),
              SizedBox(width:20),
              Icon(Icons.chat_bubble_outline,color: Colors.white,),
              Text("10",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
              Spacer(),
              Icon(Icons.bookmark_border,color:Colors.white)
            ],)
          ],),
        ),
        Container(
          margin:EdgeInsets.all(15),
          padding:EdgeInsets.all(15),
          height:80,
          decoration:BoxDecoration(
            color: Color(0xff3d3f50),
            //borderRadius: BorderRadius.all(Radius.circular(25)),
            borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))
          ),
          child: Column(children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                CircleAvatar(
                  radius:18,
                  backgroundImage: AssetImage('assets/s.webp'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("beingsalmankhan",style: TextStyle(fontWeight:FontWeight.w500,color: Colors.white),),
                Spacer(),
                Icon(Icons.more_horiz,color: Colors.white,)
              ], 
            )
          ],),
        )
      ],
      ),
    );
  }
}
