import 'package:flutter/material.dart';
import 'package:circular_page_view/circular_page_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  int _currentPage = 0;

  final Duration _animationDuration = Duration(milliseconds: 500);
  final Curve _animationCurve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Page View'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: CircularPageView(
              itemCount: 8,
              controller: _pageController,
              items: List.generate(8, (index) => _buildPage(index)),
              onPageChanged: (value) => setState(() => _currentPage = value),
              innerRadius: 0.8,
              offset: 150,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //previous button
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => _pageController.previousPage(duration: _animationDuration, curve: _animationCurve),
                ),
                //next button
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => _pageController.nextPage(duration: _animationDuration, curve: _animationCurve),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.red,
      ),
      alignment: Alignment.center,
      child: Text(
        '$index',
        style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
