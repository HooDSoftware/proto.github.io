// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_animation/onboarding_animation.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() =>
      _OnBoardingScreenState();
}

class _OnBoardingScreenState
    extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
       body: Padding(
        padding: EdgeInsets.all(8.0),
        child: OnBoardingAnimation(
          controller: PageController(initialPage: 0),
          pages: const [
            _GetCardsContent(
              image: 'images/25.png',
              cardContent:
              'Welcome to HuuDride .. Beat parking fee ..Share your ride and Earn extra Bucks',
            ),
            _GetCardsContent(
              image: 'images/20.png',
              cardContent:
              'Lease your car for cash....choose among the varieties of ensure plans to start with',
            ),
            _GetCardsContent(
              image: 'images/15.png',
              cardContent:
              'Please before your lease your car ensure your car has a kill switch and a tracker installed prior.....\n We will be responsible for damages according to your plan of choice ...but will not be responsible for car thefts'
            ),
          ],
          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.expandingDots,
          indicatorPosition: IndicatorPosition.bottomCenter,
        ),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, cardContent;

  const _GetCardsContent({
    Key? key,
    this.image = '',
    this.cardContent = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image.asset(image),
            ),
            Text(
              cardContent,
              style: GoogleFonts.itim(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}