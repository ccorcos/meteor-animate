# Meteor Animations

A multi-purpose animation block helper. Check out the [live demo](http://ccorcos-animate.meteor.com).

## Getting Started

    meteor add ccorcos:animate

The API is very similar to the [ccorcos:transitioner](https://github.com/ccorcos/meteor-transitioner) package. Basically just wrap whatever you want to animate with the animate block helper:

    {{#animate class="whatever classes you want"
               in=animation
               out=animation}}
      ...
    {{/animate}}

The animation can be one of 3 things.

1. The easiest is to pass a [VelocityJS UI Pack pre-registered effect](http://julian.com/research/velocity/#uiPack) as a string. For example, 'transition.swoopIn', 'transition.whirlOut', 'transition.slideLeftIn', etc. [A you can find a demo of these effects in the dropdown of the "Effects: Pre-Registered" section](http://julian.com/research/velocity/#uiPack). [You can also check out the source to see how to register your own effects](https://github.com/julianshapiro/velocity/blob/master/velocity.ui.js#L299).

2. If you want to pass options like easing or duration, you pass an array of velocity arguements.

3. You can create custom animations just like you would with `_uihooks.insertElement` and `_uihooks.removeElement`.
