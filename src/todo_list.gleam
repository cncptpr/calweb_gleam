// IMPORTS ---------------------------------------------------------------------

import components/todo_card.{TodoItem}
import gleam/int
import lustre.{type App}
import lustre/attribute.{attribute}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

// MAIN ------------------------------------------------------------------------

/// The only difference between this module and the counter defined in
/// 05-components/01-basic-setup is this function. The client component example
/// exposes a `register` function to register the custom element, but here we
/// expose a `component` function that constructs a Lustre application but does
/// not start it.
///
/// It's common practice to provide both functions so that your users can choose
/// where to run the component. This is known as a **universal component** because
/// it can run in both the browser and the server.
///
pub fn component() -> App(_, Model, Msg) {
  lustre.simple(init, update, view)
}

// MODEL -----------------------------------------------------------------------

pub type Model =
  Int

fn init(_) -> Model {
  0
}

// UPDATE ----------------------------------------------------------------------

pub opaque type Msg {
  UserClickedIncrement
  UserClickedDecrement
}

fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedIncrement -> model + 1
    UserClickedDecrement -> model - 1
  }
}

// VIEW ------------------------------------------------------------------------

fn view(model: Model) -> Element(Msg) {
  let count = int.to_string(model)
  // let styles = [#("display", "flex"), #("justify-content", "space-between")]
  html.div([], [
    html.div([attribute.id("todoApp"), attribute.class("todo-wrap")], [
      html.header([attribute.class("todo-header")], [
        html.h1([], [html.text("Todos")]),
        html.small(
          [attribute("aria-live", "polite"), attribute.class("todo-count")],
          [html.text("0 remaining")],
        ),
      ]),
      html.main(
        [
          attribute("aria-live", "polite"),
          attribute.id("todoList"),
          attribute.class("todo-list"),
        ],
        [
          todo_card.component(TodoItem("asdddddd", True)),
          todo_card.component(TodoItem("Anderer Todo", False)),
          todo_card.component(TodoItem("kjhasdkjkkkk", False)),
          todo_card.component(TodoItem("Wohooo!", False)),
        ],
      ),
      html.footer([attribute.class("todo-creator")], [
        html.input([
          attribute("aria-label", "Create new todo"),
          attribute.placeholder("Create new todo"),
          attribute.class("new-todo"),
          attribute.id("newTodo"),
          attribute.type_("text"),
        ]),
        html.button(
          [
            attribute("aria-label", "Add todo"),
            attribute.class("btn btn-add"),
            attribute.id("addTodoBtn"),
          ],
          [html.text("Add")],
        ),
      ]),
    ]),
  ])
}

fn view_button(label label: String, on_click handle_click: msg) -> Element(msg) {
  html.button([event.on_click(handle_click)], [html.text(label)])
}
