HTMLWidgets.widget({
  name: 'ganttr',
  type: 'output',

  factory: function(el, width, height) {

    var EVENTS_TO_ATTACH = ["onAfterTaskAdd", "onAfterBatchUpdate", "onAfterLinkAdd",
                            "onAfterLinkDelete", "onAfterLinkUpdate", "onAfterRedo",
                            "onAfterTaskDelete", "onAfterTaskMove", "onAfterTaskUpdate",
                            "onAfterUndo", "onGanttRender", "onGanttReady", "onDataRender"];
    var send_change = function(tasks) {
      Shiny && Shiny.onInputChange(el.id, tasks);
    };

    return {

      renderValue: function(tasks) {
        gantt.init(el);
        if (typeof $ !== "undefined" && $.extend) send_change($.extend(true, {}, tasks));
        gantt.parse(tasks);

        EVENTS_TO_ATTACH.map(function(event_name) {
          gantt.attachEvent(event_name, function() {
            send_change(gantt.serialize())
          });
        });
      },

      resize: function(width, height) {}
    };
  }
});
