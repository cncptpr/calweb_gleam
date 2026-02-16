import lustre/attribute.{attribute}
import lustre/element/html

pub type TodoItem {
  TodoItem(summary: String, checked: Bool)
}

pub fn component(item: TodoItem) {
  html.article([attribute("data-id", "1"), attribute.class("todo-item")], [
    html.label([attribute.class("todo-left")], [
      html.input([
        attribute.class("todo-checkbox"),
        attribute.type_("checkbox"),
        attribute.checked(item.checked),
      ]),
    ]),
    html.div([attribute.class("todo-body")], [
      html.div([attribute.class("todo-summary")], [
        html.text(item.summary),
      ]),
      // html.div([attribute.class("todo-meta")], [
    //   html.text("Due: none"),
    // ]),
    ]),
    html.div([attribute.class("todo-actions")], [
      html.button(
        [
          attribute("aria-label", "Edit todo"),
          attribute.class("btn btn-edit"),
        ],
        [html.text("Edit")],
      ),
      html.button(
        [
          attribute("aria-label", "Delete todo"),
          attribute.class("btn btn-delete"),
        ],
        [html.text("Delete")],
      ),
    ]),
  ])
}
