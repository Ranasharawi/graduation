import 'package:flutter/material.dart';
import 'package:graduation/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    @required this.body,
    @required this.image,
    @required this.title,

});
}
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();

  List<BoardingModel> boarding=[

    BoardingModel(body:'Find the job of your dreams that matches your skills' , image:'assets/images/Onboarding.jpg', title:'We are hiring!'),
    BoardingModel(body:'You can do your own interview while you are at home' , image:'assets/images/Onboarding1.jpg', title:'Online interviews'),
    BoardingModel(body:'Our first goal is to integrate all segments of society to create a productive and creative work environment' , image:'assets/images/Onboarding2.jpg', title:'Integrate into any environment')
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
        }, child: Text('skip'
        ,style: TextStyle(
            color: Colors.greenAccent
          ),))],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(

              child: PageView.builder(
                onPageChanged: (int index){
                  if(index == boarding.length-1){
                    print('Last');
                    setState(() {
                      isLast=true;
                    });
                  }else{
                    print('not Last');
                    setState(() {
                      isLast=false;
                    });

                  }
                },
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildBordingItem(boarding[index]),
                itemCount: boarding.length,

              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.greenAccent,
                      dotHeight: 10,
                      expansionFactor: 2,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(onPressed:(){
                  if(isLast){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                  }else{ boardController.nextPage(duration: Duration(
                    milliseconds: 750,
                  ), curve:Curves.fastLinearToSlowEaseIn, );
                  }

                },
                  backgroundColor: Colors.greenAccent,
                child: Icon(
                    Icons.arrow_forward_ios
                ),)
              ],

            ),



          ],
        ),
      )

    );
  }

  Widget buildBordingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image:AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start
        ,
        children: [
          Text('${model.title}',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start
        ,
        children: [
          Text('${model.body}',style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
      SizedBox(
        height: 30,
      )

    ],
  );
}
