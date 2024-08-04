import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension ScreenNavigation on BuildContext {
  Future<T?> pushWithTransition<T>(
      Widget page, PageTransitionType transitionType) {
    return Navigator.push(
      this,
      _createPageTransition(page, transitionType),
    );
  }

  Future<T?> pushReplacementWithTransition<T>(
      Widget page, PageTransitionType transitionType) {
    return Navigator.pushReplacement(
      this,
      _createPageTransition(page, transitionType),
    );
  }

  PageRoute<T> _createPageTransition<T>(
      Widget page, PageTransitionType transitionType) {
    return PageTransition(
      type: transitionType,
      alignment: Alignment.center,
      child: page,
    );
  }
}
