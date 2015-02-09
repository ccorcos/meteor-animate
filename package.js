Package.describe({
  name: 'ccorcos:animate',
  summary: 'Blaze animations with VelocityJS.',
  version: '0.0.2',
  git: 'https://github.com/ccorcos/meteor-animate'
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1');

  api.use([
    'velocityjs:velocityjs@1.2.0',
    'coffeescript',
    'templating',
  ], 'client');

  api.addFiles([
    'lib/animate.html',
    'lib/animate.coffee',
  ], 'client');
});