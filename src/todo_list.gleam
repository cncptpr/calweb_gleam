// IMPORTS ---------------------------------------------------------------------

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
  let styles = [#("display", "flex"), #("justify-content", "space-between")]

  element.fragment([
    html.body(
      [
        attribute(
          "style",
          "margin:0;font-family:system-ui,-apple-system,Segoe UI,Roboto,'Helvetica Neue',Arial;background:#f6f7fb;color:#111;",
        ),
      ],
      [
        html.header(
          [
            attribute(
              "style",
              "padding:18px 16px 12px;border-bottom:1px solid rgba(0,0,0,0.06);background:linear-gradient(180deg, #ffffff, #fbfdff);",
            ),
          ],
          [
            html.h1(
              [attribute("style", "margin:0;font-size:20px;line-height:1.1;")],
              [html.text("To‑Do")],
            ),
            html.p(
              [attribute("style", "margin:6px 0 0;font-size:13px;color:#555;")],
              [html.text("Simple mobile-first list")],
            ),
          ],
        ),
        html.main(
          [
            attribute(
              "style",
              "padding:14px 12px;max-width:720px;margin:0 auto;box-sizing:border-box;",
            ),
          ],
          [
            html.section(
              [
                attribute(
                  "style",
                  "display:flex;gap:12px;align-items:center;padding:12px;border-radius:12px;background:#fff;border:1px solid rgba(0,0,0,0.04);margin-bottom:12px;box-shadow:0 1px 2px rgba(12,15,20,0.03);",
                ),
              ],
              [
                html.input([
                  attribute(
                    "style",
                    "width:22px;height:22px;border-radius:5px;cursor:pointer;",
                  ),
                  attribute.id("t1"),
                  attribute.type_("checkbox"),
                ]),
                html.div([attribute("style", "flex:1;min-width:0;")], [
                  html.label(
                    [
                      attribute(
                        "style",
                        "display:block;font-size:16px;font-weight:600;margin-bottom:6px;cursor:pointer;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;",
                      ),
                      attribute.for("t1"),
                    ],
                    [html.text("Buy groceries")],
                  ),
                  html.div(
                    [
                      attribute(
                        "style",
                        "font-size:13px;color:#666;line-height:1.2;max-width:100%;",
                      ),
                    ],
                    [html.text("Milk, bread, eggs, and salad for week")],
                  ),
                ]),
                html.div(
                  [
                    attribute(
                      "style",
                      "display:flex;gap:8px;align-items:center;margin-left:8px;",
                    ),
                  ],
                  [
                    html.button(
                      [
                        attribute(
                          "style",
                          "background:#fff;border:1px solid rgba(0,0,0,0.06);padding:8px 10px;border-radius:8px;font-size:13px;cursor:pointer;",
                        ),
                        attribute("aria-label", "Edit todo"),
                      ],
                      [html.text("Edit")],
                    ),
                    html.button(
                      [
                        attribute(
                          "style",
                          "background:#ffecec;border:1px solid #ffcccc;color:#b30000;padding:8px 10px;border-radius:8px;font-size:13px;cursor:pointer;",
                        ),
                        attribute("aria-label", "Delete todo"),
                      ],
                      [html.text("Delete")],
                    ),
                  ],
                ),
              ],
            ),
            html.section(
              [
                attribute(
                  "style",
                  "display:flex;gap:12px;align-items:center;padding:12px;border-radius:12px;background:#fff;border:1px solid rgba(0,0,0,0.04);margin-bottom:12px;box-shadow:0 1px 2px rgba(12,15,20,0.03);",
                ),
              ],
              [
                html.input([
                  attribute(
                    "style",
                    "width:22px;height:22px;border-radius:5px;cursor:pointer;",
                  ),
                  attribute.id("t2"),
                  attribute.type_("checkbox"),
                ]),
                html.div([attribute("style", "flex:1;min-width:0;")], [
                  html.label(
                    [
                      attribute(
                        "style",
                        "display:block;font-size:16px;font-weight:600;margin-bottom:6px;cursor:pointer;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;",
                      ),
                      attribute.for("t2"),
                    ],
                    [html.text("Call Alice")],
                  ),
                  html.div(
                    [
                      attribute(
                        "style",
                        "font-size:13px;color:#666;line-height:1.2;max-width:100%;",
                      ),
                    ],
                    [html.text("Discuss project timeline and next steps")],
                  ),
                ]),
                html.div(
                  [
                    attribute(
                      "style",
                      "display:flex;gap:8px;align-items:center;margin-left:8px;",
                    ),
                  ],
                  [
                    html.button(
                      [
                        attribute(
                          "style",
                          "background:#fff;border:1px solid rgba(0,0,0,0.06);padding:8px 10px;border-radius:8px;font-size:13px;cursor:pointer;",
                        ),
                        attribute("aria-label", "Edit todo"),
                      ],
                      [html.text("Edit")],
                    ),
                    html.button(
                      [
                        attribute(
                          "style",
                          "background:#ffecec;border:1px solid #ffcccc;color:#b30000;padding:8px 10px;border-radius:8px;font-size:13px;cursor:pointer;",
                        ),
                        attribute("aria-label", "Delete todo"),
                      ],
                      [html.text("Delete")],
                    ),
                  ],
                ),
              ],
            ),
            html.section(
              [
                attribute(
                  "style",
                  "display:flex;gap:12px;align-items:center;padding:12px;border-radius:12px;background:#fff;border:1px solid rgba(0,0,0,0.04);margin-bottom:12px;box-shadow:0 1px 2px rgba(12,15,20,0.03);opacity:0.9;",
                ),
              ],
              [
                html.input([
                  attribute(
                    "style",
                    "width:22px;height:22px;border-radius:5px;cursor:pointer;",
                  ),
                  attribute.checked(True),
                  attribute.id("t3"),
                  attribute.type_("checkbox"),
                ]),
                html.div([attribute("style", "flex:1;min-width:0;")], [
                  html.label(
                    [
                      attribute(
                        "style",
                        "display:block;font-size:16px;font-weight:600;margin-bottom:6px;cursor:pointer;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;text-decoration:line-through;color:#777;",
                      ),
                      attribute.for("t3"),
                    ],
                    [html.text("Walk the dog")],
                  ),
                  html.div(
                    [
                      attribute(
                        "style",
                        "font-size:13px;color:#888;line-height:1.2;max-width:100%;text-decoration:line-through;",
                      ),
                    ],
                    [html.text("Evening walk — 30 minutes")],
                  ),
                ]),
                html.div(
                  [
                    attribute(
                      "style",
                      "display:flex;gap:8px;align-items:center;margin-left:8px;",
                    ),
                  ],
                  [
                    html.button(
                      [
                        attribute(
                          "style",
                          "background:#fff;border:1px solid rgba(0,0,0,0.06);padding:8px 10px;border-radius:8px;font-size:13px;cursor:pointer;",
                        ),
                        attribute("aria-label", "Edit todo"),
                      ],
                      [html.text("Edit")],
                    ),
                    html.button(
                      [
                        attribute(
                          "style",
                          "background:#ffecec;border:1px solid #ffcccc;color:#b30000;padding:8px 10px;border-radius:8px;font-size:13px;cursor:pointer;",
                        ),
                        attribute("aria-label", "Delete todo"),
                      ],
                      [html.text("Delete")],
                    ),
                  ],
                ),
              ],
            ),
            html.form(
              [
                attribute("onsubmit", "event.preventDefault();addTodo();"),
                attribute(
                  "style",
                  "display:flex;gap:8px;align-items:center;margin-top:6px;",
                ),
              ],
              [
                html.input([
                  attribute(
                    "style",
                    "flex:1;padding:12px 14px;font-size:16px;border-radius:12px;border:1px solid rgba(0,0,0,0.08);box-shadow:inset 0 1px 0 rgba(255,255,255,0.6);min-width:0;",
                  ),
                  attribute.required(True),
                  attribute.placeholder("New todo title"),
                  attribute.type_("text"),
                  attribute.id("newTitle"),
                ]),
                html.input([
                  attribute(
                    "style",
                    "flex:1;padding:12px 14px;font-size:15px;border-radius:12px;border:1px solid rgba(0,0,0,0.06);min-width:0;display:none;",
                  ),
                  attribute.placeholder("Optional description"),
                  attribute.type_("text"),
                  attribute.id("newDesc"),
                ]),
                html.button(
                  [
                    attribute(
                      "style",
                      "background:#0b69ff;color:#fff;padding:12px 14px;border-radius:12px;border:none;font-weight:600;font-size:15px;cursor:pointer;",
                    ),
                    attribute.type_("submit"),
                  ],
                  [html.text("Create")],
                ),
              ],
            ),
            html.p(
              [attribute("style", "margin:10px 0 0;font-size:12px;color:#666;")],
              [
                html.text(
                  "Tip: tap a title to toggle completion. Use Edit/Delete to modify.",
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ])
}

fn view_button(label label: String, on_click handle_click: msg) -> Element(msg) {
  html.button([event.on_click(handle_click)], [html.text(label)])
}
