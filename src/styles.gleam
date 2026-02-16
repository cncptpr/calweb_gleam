// Generated with wrap-css.fish
pub const css = "
:root{
  --bg:#0b0e11;
  --panel:#0f1417;
  --muted:#9aa3ad;
  --accent:#6be5a3;
  --danger:#ff6b6b;
  --glass: rgba(255,255,255,0.03);
  --card-shadow: 0 6px 18px rgba(0,0,0,0.6);
  --radius:12px;
  --gap:12px;
  --text:#e6eef3;
  --subtle:#b9c2c9;
}

/* Page-level styling (applies to full page though component is a single div) */
html,body{
  height:100%;
  margin:0;
  background:linear-gradient(180deg, var(--bg) 0%, #050607 100%);
  color:var(--text);
  font-family: Inter, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial;
  -webkit-font-smoothing:antialiased;
  -moz-osx-font-smoothing:grayscale;
  -webkit-tap-highlight-color: transparent;
  -webkit-touch-callout:none;
}

/* Centering for demo - optional */
body{
  display:flex;
  align-items:flex-start;
  justify-content:center;
  padding:28px;
}

/* Outer wrapper (the only top-level element in HTML) */
.todo-wrap{
  display:flex;
  flex-direction:column;
  width:100%;
  max-width:620px;
  background:linear-gradient(180deg, rgba(255,255,255,0.02), transparent);
  border-radius:var(--radius);
  padding:16px;
  box-shadow:var(--card-shadow);
  border:1px solid rgba(255,255,255,0.03);
  box-sizing:border-box;
}

/* Header */
.todo-header{
  display:flex;
  align-items:baseline;
  justify-content:space-between;
  gap:8px;
  margin-bottom:12px;
}
.todo-header h1{
  font-size:18px;
  margin:0;
  letter-spacing:0.2px;
  /* color: red; */
}
.todo-count{
  color:var(--muted);
  font-size:13px;
}

/* Main list vertical, mobile-first */
.todo-list{
  display:flex;
  flex-direction:column;
  gap:var(--gap);
  max-height:60vh;
  overflow:auto;
  padding-right:6px;
}

/* Item card */
.todo-item{
  display:flex;
  align-items:center;
  gap:12px;
  background:var(--panel);
  border-radius:10px;
  padding:10px;
  border:1px solid rgba(255,255,255,0.02);
  box-shadow: 0 4px 10px rgba(0,0,0,0.5);
}

/* Checkbox left column */
.todo-left{
  display:inline-flex;
  align-items:center;
  justify-content:center;
  min-width:40px;
  min-height:40px;
  border-radius:8px;
  background:var(--glass);
  padding:6px;
}
.todo-checkbox{
  width:20px;
  height:20px;
  accent-color:var(--accent);
}

/* Body: summary and meta */
.todo-body{
  flex:1 1 auto;
  min-width:0;
}
.todo-summary{
  font-size:15px;
  font-weight:600;
  color:var(--text);
  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
}
.todo-meta{
  font-size:12px;
  color:var(--subtle);
  margin-top:4px;
}

/* Actions */
.todo-actions{
  display:flex;
  gap:8px;
  align-items:center;
}
.btn{
  background:transparent;
  color:var(--muted);
  border:1px solid rgba(255,255,255,0.03);
  padding:6px 8px;
  border-radius:8px;
  font-size:13px;
  cursor:pointer;
}
.btn:hover{ color:var(--text); border-color:rgba(255,255,255,0.06); transform:translateY(-1px); }
.btn:active{ transform:translateY(0); }

/* Edit/Delete color hints */
.btn-edit{ color:var(--accent); border-color: rgba(107,229,163,0.08); }
.btn-delete{ color:var(--danger); border-color: rgba(255,107,107,0.06); }

/* Footer creator (fixed bottom inside component) */
.todo-creator{
  display:flex;
  gap:8px;
  margin-top:12px;
  align-items:center;
}
.new-todo{
  flex:1 1 auto;
  min-width:0;
  background:rgba(255,255,255,0.02);
  color:var(--text);
  border:1px solid rgba(255,255,255,0.03);
  padding:10px 12px;
  border-radius:10px;
  font-size:14px;
  outline:none;
}
.new-todo::placeholder{ color:var(--muted); }
.btn-add{
  background:linear-gradient(180deg, rgba(107,229,163,0.12), rgba(107,229,163,0.06));
  color:var(--accent);
  border:1px solid rgba(107,229,163,0.12);
}

/* Small devices spacing */
/* @media (min-width:640px){ */
  /* .todo-wrap{ padding:18px; } */
  /* .todo-header h1{ font-size:20px; } */
/* } */

/* Larger screens: multi-column layout (optional enhancement) */
/* @media (min-width:900px){ */
  /* .todo-wrap{ display:grid; grid-template-columns:1fr 320px; gap:18px; align-items:start; } */
  /* .todo-list{ grid-column:1; max-height:none; } */
  /* .todo-creator{ grid-column:2; flex-direction:column; align-items:stretch; margin-top:0; } */
  /* .btn-add{ width:100%; } */
/* } */

"
