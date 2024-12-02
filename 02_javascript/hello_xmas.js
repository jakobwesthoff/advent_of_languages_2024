/*
        /\
       /  \
       /  \
      /  o \
      /    \
     / u    \
     --------
        ||
        ||
*/

const pad = (length) => " ".repeat(length);
const treePad = (length) => {
  let padding = "";
  for (let i = 0; i < length; i++) {
    if (Math.random() < 0.1) {
      padding += "o";
    } else {
      padding += " ";
    }
  }
  return padding;
};

function drawGroup(n, len) {
  console.log(`${pad(len - n)}/${treePad(n * 2)}\\`);
  console.log(`${pad(len - n - 1)}/${treePad((n + 1) * 2)}\\`);
}

function drawTrunk(spacing) {
  console.log(`${pad(spacing)}||`);
  console.log(`${pad(spacing)}||`);
}

function drawTree() {
  const groups = 4;
  for (let i = 0; i < groups; i++) {
    drawGroup(i, groups);
  }
  console.log("-".repeat(groups * 2 + 2));

  drawTrunk(groups);
}

drawTree();
