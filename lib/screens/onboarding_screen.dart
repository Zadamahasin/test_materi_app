// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:test_materi/screens/materi_screen.dart';
import '../models/onboarding_model.dart';

class OnboardingPageScreen extends StatefulWidget {
  const OnboardingPageScreen({super.key});

  @override
  State<OnboardingPageScreen> createState() => _OnboardingPageScreenState();
}

class _OnboardingPageScreenState extends State<OnboardingPageScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          OnboardingPage(
            title: "Quality Food",
            description:
                "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            image: Icons.fastfood,
          ),
          OnboardingPage(
            title: "Fresh Ingredients",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: Icons.local_dining,
          ),
          OnboardingPage(
            title: "Fast Delivery",
            description:
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            image: Icons.delivery_dining,
          ),
        ],
      ),
      bottomSheet: _currentPage == 2
          ? Container(
              height: 80,
              width: double.infinity,
              color: Colors.orange,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MateriScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Mulai",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text(
                      "Lewati",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: List<Widget>.generate(3, (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 10,
                        width: _currentPage == index ? 20 : 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.orange
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    }),
                  ),
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Berikutnya",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData image;

  OnboardingPage(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            image,
            size: 100,
            color: Colors.orange,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
