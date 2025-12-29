const input = document.getElementById("task-input");
const addBtn = document.getElementById("add-btn");
const categorySelect = document.getElementById("category-select");
const list = document.getElementById("todo-list");
const filterBtns = document.querySelectorAll("#filters button");
const countsBox = document.getElementById("counts");

let todos = JSON.parse(localStorage.getItem("todos")) || [];
let currentFilter = "All";

function save() {
  localStorage.setItem("todos", JSON.stringify(todos));
}

function updateCounts() {
  const work = todos.filter(t => t.category === "Work").length;
  const personal = todos.filter(t => t.category === "Personal").length;
  const all = todos.length;
  countsBox.textContent = `All: ${all} | Work: ${work} | Personal: ${personal}`;
}

function render() {
  list.innerHTML = "";
  todos
    .filter(t => currentFilter === "All" || t.category === currentFilter)
    .forEach((todo, i) => {
      const li = document.createElement("li");
      li.className = todo.completed ? "completed" : "";

      const span = document.createElement("span");
      span.textContent = todo.text;

      const checkbox = document.createElement("input");
      checkbox.type = "checkbox";
      checkbox.checked = todo.completed;
      checkbox.onchange = () => {
        todo.completed = !todo.completed;
        save();
        render();
      };

      const cat = document.createElement("span");
      cat.className = "cat-tag";
      cat.textContent = todo.category;

      const del = document.createElement("span");
      del.textContent = "X";
      del.className = "delete";
      del.onclick = () => {
        todos.splice(i, 1);
        save();
        render();
      };

      li.append(checkbox, span, cat, del);
      list.appendChild(li);
    });

  updateCounts();
}

addBtn.onclick = () => {
  const text = input.value.trim();
  if (!text) return;

  todos.push({
    text,
    category: categorySelect.value,
    completed: false,
  });

  input.value = "";
  save();
  render();
};

filterBtns.forEach(btn => {
  btn.onclick = () => {
    currentFilter = btn.dataset.filter;
    filterBtns.forEach(b => (b.style.background = ""));
    btn.style.background = "#ddd";
    render();
  };
});

render();