class AwsBucket {
  ?inflight name: str;
//^^^^^^^^^ Unexpected 'maybe_inflight_specifier'
}

inflight class Foo {
  pub static ?inflight format(key: str): str {
    return "s3://foo/${key}";
  }
//^ Inflight classes can not contain maybe-inflight methods
}

class Bucket {
  var name: str; // preflight mutable field

  init() {
    this.name = "foo";
  }

  ?inflight set_name(name: str): void {
    this.name = name;
//  ^^^^^^^^^ Variable cannot be reassigned from maybe-inflight
  }
}
