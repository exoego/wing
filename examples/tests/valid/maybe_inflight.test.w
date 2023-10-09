let sum = ?inflight (a: num, b: num): num => {
  return a + b;
};

let odds = sum(1, 2);

let handler = inflight () => {
  let big_odds = sum(7, 8);
};
