HTMLWidgets.widget({

  name: 'ganttr',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(tasks) {
        gantt.init(el);
    		gantt.parse(tasks);

    		Shiny.onInputChange(el.id, gantt.serialize());
        gantt.attachEvent("onAfterTaskAdd", function(id, e) {
          console.log(el.id);
      		Shiny.onInputChange(el.id, gantt.serialize());
        });
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
