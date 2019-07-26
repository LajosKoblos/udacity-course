// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';

final _height = 100.0;
final _borderRadius = _height / 2;

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
  final MaterialColor categoryColor;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  const Category({
    Key key,
    @required this.categoryName,
    @required this.categoryIcon,
    @required this.categoryColor,
  })  : assert(categoryName != null),
        assert(categoryIcon != null),
        assert(categoryColor != null),
        super(key: key);

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _height,
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          highlightColor: categoryColor,
          splashColor: categoryColor,
          onTap: () {
            print('I was tapped!');
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  categoryIcon,
                  size: 60.0,
                ),
              ),
              Text(
                categoryName,
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
