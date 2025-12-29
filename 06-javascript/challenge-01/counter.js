let count = 0;
let step = 1;

const valueEl = document.getElementById("value");
const decBtn = document.getElementById("dec");
const resetBtn = document.getElementById("reset");
const incBtn = document.getElementById("inc");
const stepButtons = document.querySelectorAll("#steps button");

function updateDisplay() {
  valueEl.textContent = count;

  if (count === 0) valueEl.style.color = "black";
  else if (count > 0) valueEl.style.color = "green";
  else valueEl.style.color = "red";
}

incBtn.onclick = () => {
  count += step;
  updateDisplay();
};

decBtn.onclick = () => {
  if (count > 0) {
    count -= step;
    if (count < 0) count = 0;
  }
  updateDisplay();
};

resetBtn.onclick = () => {
  count = 0;
  updateDisplay();
};


stepButtons.forEach(btn => {
  btn.onclick = () => {
    step = Number(btn.dataset.step);
    stepButtons.forEach(b => (b.style.background = ""));
    btn.style.background = "#ddd";
  };
});

updateDisplay();