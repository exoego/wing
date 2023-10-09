let sum = ?inflight (a: num, b: num): num => {
  return a + b;
};
assert(sum(1, 2) == 3);

let handler = inflight () => {
  let big_odds = sum(7, 8);
};

class AwsBucket {
  name: str; // preflight field

  init() {
    this.name = "my-bucket";
  }

  pub ?inflight object_url(key: str): str {
    // This method references a preflight field (this.name) -- that is
    // possible in both phases so it is OK!
    return "s3://${this.name}/${key}";
  }

  pub static ?inflight format(key: str): str {
    return "s3://static/${key}";
  }
}

let f = new AwsBucket();
assert(f.object_url("foo") == "s3://my-bucket/foo");
assert(AwsBucket.format("foo") == "s3://static/foo");

test "maybe inflight" {
  assert(f.object_url("bar") == "s3://my-bucket/bar");
  assert(AwsBucket.format("bar") == "s3://static/bar");
}
