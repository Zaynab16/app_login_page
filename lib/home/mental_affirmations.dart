
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class AffirmationPage extends StatefulWidget {
  @override
  _AffirmationPageState createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  final List<String> affirmations = [
    'I am confident and capable.',
    'I radiate love and positivity.',
    'I am deserving of success.',
    'I am surrounded by abundance.',
    'I am grateful for all that I have.',
    'I love myself.',
    'I am proud of who I am.',
    'I can do anything',
    'I am worthy of love.',
    'I am kind.',
    'I am beautiful.',
    'I am more than the trauma I endured.',
    'I love myself.',
    'I choose what I become.',
    'I am likeable and fun to be around.',
    'I forgive myself for my past mistakes.',
    'I am optimistic.',
    'I forgive everyone who has hurt me for my own peace of mind.',
    'I need not destroy the past as it is already gone.',
    'I accept my past but it does not control or define me.',
    'My future needs me; my past doesn\'t.',
    'I am unstoppable because I know  deserve better.',
    'There is no failure. I will either win or learn.',
    'I did my best today, and that\'s enough.',
    'I am stronger than my excuses.'

  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sky.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Swiper(
            itemCount: affirmations.length,
            index: currentIndex,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: 300,
                    height: 200,
                    child: Center(
                      child: Text(
                        affirmations[index],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
            layout: SwiperLayout.STACK,
            itemWidth: 300,
            itemHeight: 1000,
            scrollDirection: Axis.vertical,
          ),
        ],
      ),
    );
  }

}