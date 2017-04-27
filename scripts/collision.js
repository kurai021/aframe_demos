setTimeout(function () {
  var impulse = { x: 50, y: 2, z: 5 };
  var point = { x: 0, y: 0, z: 0 };
  box.components['physics-body'].applyImpulse(impulse, point);
}, 2500);
