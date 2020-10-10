# Circular Page View 

 A new Flutter package for Android, iOS & Web which helps in creating animated circular carousel with configurable settings.

### Preview
![](./assets/preview.gif)


### Usage

- Import the package
```
dependencies:
  circular_page_view: ^0.0.1
```
- Import in the file

```dart
import 'package:circular_page_view/circular_page_view.dart';
```

- Use of the Widget

```dart
CircularPageView(
  itemCount: 8,
  controller: _pageController,
  items: List.generate(8, (index) => _buildPage(index)),
  onPageChanged: (value) => setState(() => _currentPage = value),
  innerRadius: 0.8,
  offset: 150,
),
```
