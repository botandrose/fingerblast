Ember.ArrayProxy.prototype.flatten = Array.prototype.flatten = function() {
  var r = [];
  this.forEach(function(el) {
    r.push.apply(r, Ember.isArray(el)  ? el.flatten() : [el]);
  });
  return r;
}

Array.prototype.groupBy = function(keyName) {
  var res = {};
  this.forEach(function(x) {
    var k = x[keyName];
    var v = res[k];
    if (!v) v = res[k] = [];
    v.push(x);
  });
  return res;
};
