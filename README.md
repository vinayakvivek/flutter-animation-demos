# Flutter Animation Demos 

<img src="https://cdn.worldvectorlogo.com/logos/flutter.svg" height="50">

A simple flutter app to showcase different ways to animate stuffs in flutter. Created this repo mainly as a future reference.

### Animations
- [AnimatedContainer](https://github.com/vinayakvivek/flutter-animation-demos/blob/master/lib/widgets/animated_container_demo.dart)
- [TweenAnimationBuilder](https://github.com/vinayakvivek/flutter-animation-demos/blob/master/lib/widgets/tween_demo.dart)
- [Explicit Animation](https://github.com/vinayakvivek/flutter-animation-demos/blob/master/lib/widgets/explicit_animation_builder_demo.dart)
  - If you are using `flutter_hooks`, you should probably use `useAnimationController` hook. Makes you life a lot easier. Checkout `GestureControlled` in this list.
- [Using AnimatedWidget](https://github.com/vinayakvivek/flutter-animation-demos/blob/master/lib/widgets/custom_animation_demo.dart)
  - This example is from the official flutter animation series.
- [Physics based](https://github.com/vinayakvivek/flutter-animation-demos/blob/master/lib/widgets/physics_based_demo.dart)
  - AnimationController `animateWith` is the focus in this.
- [GestureControlled](https://github.com/vinayakvivek/flutter-animation-demos/blob/master/lib/widgets/gesture_controlled_demo.dart)
  - Very useful template. 
  - Updates the animation controller according to vertical drag update, and this change is notified in other Widgets using [river_pod](https://github.com/rrousselGit/river_pod)
