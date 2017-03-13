HTMLWidgets.widget({

  name: 'ganttr',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(tasks) {
        gantt.init(el);
    		gantt.parse(tasks);
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
