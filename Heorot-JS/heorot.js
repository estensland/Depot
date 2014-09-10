window.heorot = (function(){
  var Heorot = function (array) {
    for(var i = 0; i < array.length; i++ ) {
      this[i] = array[i];
    }
    this.length = array.length;
  }

  var heorot = {
    t: function(array){
      return new Heorot(array);
    },

    each: function(array, func){
      for (var i=0, ii = array.length; i < ii; i ++) {
        func(array[i]);
      }
    },
    
    stringEach: function(array, i, deal) {
      var func = new Function(i, deal);
      for (var i = 0, ii = array.length; i < ii; i++){
        func(array[i]);
      }
    },

    map: function(array, func){
      returnArray = [];
      for (var i=0, ii = array.length; i < ii; i ++) {
        returnArray.push(func(array[i]));
      }
      return returnArray;
    },

    stringMap: function(array, i, deal) {
      var func = new Function(i, deal);
      rA = [];
      for (var i = 0, ii = array.length; i < ii; i++){
        rA.push(func(array[i]));
      }
      return rA;
    },

    select: function(array, func){
      returnArray = []
      for (var i=0, ii = array.length; i < ii; i ++) {
        if (func(array[i])){
          returnArray.push(array[i]);
        }
      }
      return returnArray
    },
    
    stringSelect: function(array, i, deal) {
      var func = new Function(i, deal);
      rA = [];
      for (var i = 0, ii = array.length; i < ii; i++){
        if (func(array[i])){
          rA.push(array[i]);
        }
      }
      return rA;
    },

    reject: function(array, func){
      returnArray = []
      for (var i=0, ii = array.length; i < ii; i ++) {
        if (!func(array[i])){
          returnArray.push(array[i]);
        }
      }
      return returnArray;
    },
    
    stringReject: function(array, i, deal) {
      var func = new Function(i, deal);
      rA = [];
      for (var i = 0, ii = array.length; i < ii; i++){
        if (!func(array[i])){
          rA.push(array[i]);
        }
      }
      return rA;
    },
    
    sortBySortAttr: function (parent, sortedSelector, keySelector) {
      var sections = $(parent).find(sortedSelector).sort(function(a, b) {
        var vA = Paths.grabTextParseInt($(keySelector, a));
        var vB = Paths.grabTextParseInt($(keySelector, b));
        return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
      });
      $(parent).append(sections);
    },
    
    scrollHelper : {
      scrollCheck: function(stationaryElement, event, amount){
        if (this.insideXAxisCheck(stationaryElement, event)) {
          var topOfElement = stationaryElement.offset().top;

          if (topOfElement > event.pageY){
            this.scrollListUp(stationaryElement, amount);
          }

          else if (topOfElement + stationaryElement.height() < event.pageY) {
            this.scrollListDown(stationaryElement, amount);
          }
        }
      },

      insideXAxisCheck: function(stationaryElement, event) {
        var offset = stationaryElement.offset();
        var leftOfElement = offset.left;
        var rightOfElement = offset.left + stationaryElement.width();

        return (event.pageX < rightOfElement && event.pageX > leftOfElement);
      },

      scrollListUp: function(stationaryElement, amount) {
        stationaryElement.scrollTop(stationaryElement.scrollTop() - amount);
      },

      scrollListDown: function(stationaryElement, amount) {
        stationaryElement.scrollTop(stationaryElement.scrollTop() + amount);
      }
    },
    
    browserSubmit: function (action, method, input) {
      var form = $('<form />', {
        action: action,
        method: method,
        style: 'display: none;'
      });
      if (typeof input !== 'undefined') {
        $.each(input, function (name, value) {
          $('<input />', {
            type: 'hidden',
            name: name,
            value: value
          }).appendTo(form);
        });
      }
      form.appendTo('body').submit();
    }
  }

  Heorot.prototype.each = function (callback) {
    return heorot.each(this, callback);
  };
  
  Heorot.prototype.iEach = function (callback) {
    return heorot.stringEach(this, 'i', callback);
  };

  Heorot.prototype.xEach = function (callback) {
    return heorot.stringEach(this, 'x', callback);
  };

  Heorot.prototype.yEach = function (callback) {
    return heorot.stringEach(this, 'y', callback);
  };
  
  Heorot.prototype.map = function (callback) {
    return heorot.map(this, callback);
  };

  Heorot.prototype.iMap = function (callback) {
    return heorot.stringMap(this, 'i', callback);
  };

  Heorot.prototype.xMap = function (callback) {
    return heorot.stringMap(this, 'x', callback);
  };

  Heorot.prototype.yMap = function (callback) {
    return heorot.stringMap(this, 'y', callback);
  };

  Heorot.prototype.select = function (callback) {
    return heorot.select(this, callback);
  };
  
  Heorot.prototype.iSelect = function (callback) {
    return heorot.stringSelect(this, 'i', callback);
  };

  Heorot.prototype.xSelect = function (callback) {
    return heorot.stringSelect(this, 'x', callback);
  };

  Heorot.prototype.ySelect = function (callback) {
    return heorot.stringSelect(this, 'y', callback);
  };

  Heorot.prototype.reject = function (callback) {
    return heorot.reject(this, callback);
  };
  
  Heorot.prototype.iReject = function (callback) {
    return heorot.stringReject(this, 'i', callback);
  };

  Heorot.prototype.xReject = function (callback) {
    return heorot.stringReject(this, 'x', callback);
  };

  Heorot.prototype.ySelect = function (callback) {
    return heorot.stringReject(this, 'y', callback);
  };

  return heorot;
}());

H = heorot;
