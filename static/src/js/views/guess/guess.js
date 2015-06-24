define([
'jquery',
'underscore',
'backbone',
'./partial/title',
'./partial/workspace',
'./partial/footer',
'./partial/live'],
function ($, _, Backbone, Title, WorkSpace, Footer, Live) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guess',
    initialize: function () {
      this.title= new Title();
      this.$el.append(this.title.el);
      this.live = new Live();
      this.$el.append(this.live.el);
      this.workSpace = new WorkSpace();
      this.$el.append(this.workSpace.el);
      this.footer = new Footer();
      this.$el.append(this.footer.el);
    }
  });
});
