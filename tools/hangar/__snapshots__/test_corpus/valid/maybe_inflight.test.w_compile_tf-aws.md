# [maybe_inflight.test.w](../../../../../examples/tests/valid/maybe_inflight.test.w) | compile | tf-aws

## inflight.$Closure1-1.js
```js
module.exports = function({ $_sum_7_8__ }) {
  class $Closure1 {
    constructor({  }) {
      const $obj = (...args) => this.handle(...args);
      Object.setPrototypeOf($obj, this);
      return $obj;
    }
    async handle() {
      const big_odds = $_sum_7_8__;
    }
  }
  return $Closure1;
}

```

## inflight.$Closure2-1.js
```js
module.exports = function({ $AwsBucket, $_f_object_url__bar___ }) {
  class $Closure2 {
    constructor({  }) {
      const $obj = (...args) => this.handle(...args);
      Object.setPrototypeOf($obj, this);
      return $obj;
    }
    async handle() {
      {((cond) => {if (!cond) throw new Error("assertion failed: f.object_url(\"bar\") == \"s3://my-bucket/bar\"")})((((a,b) => { try { return require('assert').deepStrictEqual(a,b) === undefined; } catch { return false; } })($_f_object_url__bar___,"s3://my-bucket/bar")))};
      {((cond) => {if (!cond) throw new Error("assertion failed: AwsBucket.format(\"bar\") == \"s3://static/bar\"")})((((a,b) => { try { return require('assert').deepStrictEqual(a,b) === undefined; } catch { return false; } })((await $AwsBucket.format("bar")),"s3://static/bar")))};
    }
  }
  return $Closure2;
}

```

## inflight.AwsBucket-1.js
```js
module.exports = function({  }) {
  class AwsBucket {
    constructor({ $this_name }) {
      this.$this_name = $this_name;
    }
    object_url(key) {
      return String.raw({ raw: ["s3://", "/", ""] }, this.$this_name, key);
    }
    static format(key) {
      return String.raw({ raw: ["s3://static/", ""] }, key);
    }
  }
  return AwsBucket;
}

```

## main.tf.json
```json
{
  "//": {
    "metadata": {
      "backend": "local",
      "stackName": "root",
      "version": "0.17.0"
    },
    "outputs": {
      "root": {
        "Default": {
          "cloud.TestRunner": {
            "TestFunctionArns": "WING_TEST_RUNNER_FUNCTION_ARNS"
          }
        }
      }
    }
  },
  "output": {
    "WING_TEST_RUNNER_FUNCTION_ARNS": {
      "value": "[]"
    }
  },
  "provider": {
    "aws": [
      {}
    ]
  }
}
```

## preflight.js
```js
const $stdlib = require('@winglang/sdk');
const $plugins = ((s) => !s ? [] : s.split(';'))(process.env.WING_PLUGIN_PATHS);
const $outdir = process.env.WING_SYNTH_DIR ?? ".";
const $wing_is_test = process.env.WING_IS_TEST === "true";
const std = $stdlib.std;
class $Root extends $stdlib.std.Resource {
  constructor(scope, id) {
    super(scope, id);
    class $Closure1 extends $stdlib.std.Resource {
      constructor(scope, id, ) {
        super(scope, id);
        (std.Node.of(this)).hidden = true;
      }
      static _toInflightType(context) {
        return `
          require("./inflight.$Closure1-1.js")({
            $_sum_7_8__: ${context._lift((sum(7,8)))},
          })
        `;
      }
      _toInflight() {
        return `
          (await (async () => {
            const $Closure1Client = ${$Closure1._toInflightType(this)};
            const client = new $Closure1Client({
            });
            if (client.$inflight_init) { await client.$inflight_init(); }
            return client;
          })())
        `;
      }
      _getInflightOps() {
        return ["handle", "$inflight_init"];
      }
      _registerBind(host, ops) {
        if (ops.includes("handle")) {
          $Closure1._registerBindObject((sum(7,8)), host, []);
        }
        super._registerBind(host, ops);
      }
    }
    class AwsBucket extends $stdlib.std.Resource {
      constructor(scope, id, ) {
        super(scope, id);
        this.name = "my-bucket";
      }
      object_url(key) {
        return String.raw({ raw: ["s3://", "/", ""] }, this.name, key);
      }
      static format(key) {
        return String.raw({ raw: ["s3://static/", ""] }, key);
      }
      static _toInflightType(context) {
        return `
          require("./inflight.AwsBucket-1.js")({
          })
        `;
      }
      _toInflight() {
        return `
          (await (async () => {
            const AwsBucketClient = ${AwsBucket._toInflightType(this)};
            const client = new AwsBucketClient({
              $this_name: ${this._lift(this.name)},
            });
            if (client.$inflight_init) { await client.$inflight_init(); }
            return client;
          })())
        `;
      }
      _getInflightOps() {
        return ["object_url", "format", "$inflight_init"];
      }
      _registerBind(host, ops) {
        if (ops.includes("$inflight_init")) {
          AwsBucket._registerBindObject(this.name, host, []);
        }
        if (ops.includes("object_url")) {
          AwsBucket._registerBindObject(this.name, host, []);
        }
        super._registerBind(host, ops);
      }
    }
    class $Closure2 extends $stdlib.std.Resource {
      constructor(scope, id, ) {
        super(scope, id);
        (std.Node.of(this)).hidden = true;
      }
      static _toInflightType(context) {
        return `
          require("./inflight.$Closure2-1.js")({
            $AwsBucket: ${context._lift(AwsBucket)},
            $_f_object_url__bar___: ${context._lift((f.object_url("bar")))},
          })
        `;
      }
      _toInflight() {
        return `
          (await (async () => {
            const $Closure2Client = ${$Closure2._toInflightType(this)};
            const client = new $Closure2Client({
            });
            if (client.$inflight_init) { await client.$inflight_init(); }
            return client;
          })())
        `;
      }
      _getInflightOps() {
        return ["handle", "$inflight_init"];
      }
      _registerBind(host, ops) {
        if (ops.includes("handle")) {
          $Closure2._registerBindObject((f.object_url("bar")), host, []);
          $Closure2._registerBindObject(AwsBucket, host, ["format"]);
        }
        super._registerBind(host, ops);
      }
    }
    const sum = ((a, b) => {
      return (a + b);
    });
    {((cond) => {if (!cond) throw new Error("assertion failed: sum(1, 2) == 3")})((((a,b) => { try { return require('assert').deepStrictEqual(a,b) === undefined; } catch { return false; } })((sum(1,2)),3)))};
    const handler = new $Closure1(this,"$Closure1");
    const f = new AwsBucket(this,"AwsBucket");
    {((cond) => {if (!cond) throw new Error("assertion failed: f.object_url(\"foo\") == \"s3://my-bucket/foo\"")})((((a,b) => { try { return require('assert').deepStrictEqual(a,b) === undefined; } catch { return false; } })((f.object_url("foo")),"s3://my-bucket/foo")))};
    {((cond) => {if (!cond) throw new Error("assertion failed: AwsBucket.format(\"foo\") == \"s3://static/foo\"")})((((a,b) => { try { return require('assert').deepStrictEqual(a,b) === undefined; } catch { return false; } })((AwsBucket.format("foo")),"s3://static/foo")))};
    this.node.root.new("@winglang/sdk.std.Test",std.Test,this,"test:maybe inflight",new $Closure2(this,"$Closure2"));
  }
}
const $App = $stdlib.core.App.for(process.env.WING_TARGET);
new $App({ outdir: $outdir, name: "maybe_inflight.test", rootConstruct: $Root, plugins: $plugins, isTestEnvironment: $wing_is_test, entrypointDir: process.env['WING_SOURCE_DIR'], rootId: process.env['WING_ROOT_ID'] }).synth();

```

