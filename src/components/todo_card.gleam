import gleam/option.{type Option, None, Some}
import lustre/attribute.{attribute}
import lustre/element/html
import lustre/stylish as el
import lustre/stylish/input

pub type TodoItem {
  TodoItem(summary: String, checked: Bool)
}

pub fn component(item: TodoItem) {
  el.row([], [
    input.default_checkbox(False),
    el.text(item.summary),
    input.button([], input.ButtonConfig(None, el.text("✏️"))),
    input.button([], input.ButtonConfig(None, el.text("🗑️"))),
  ])
}
