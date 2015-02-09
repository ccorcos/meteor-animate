
$.Velocity.RegisterEffect 'transition.shrinkOut', 
  defaultDuration: 800,
  calls: [
    [{height: [0, 200], width: [0, 200], lineHeight: [0, 200], fontSize: [0, 14], marginTop: [100, 0], easing:"ease-in-out"}]
  ]

$.Velocity.RegisterEffect 'transition.shrinkIn', 
  defaultDuration: 800,
  calls: [
    [{height: [200, 0], width: [200, 0], lineHeight: [200, 0], fontSize: [14, 0], marginTop: [0, 100],easing:"ease-in-out"}]
  ]


Session.setDefault("show", false)

Template.main.helpers
  show: -> 
    Session.get('show')

Template.main.events 
  'click .click': -> 
    Session.set("show", not Session.get("show"))
    

