<!--

@license Apache-2.0

Copyright (c) 2018 The Stdlib Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

-->

# gammincinv

[![NPM version][npm-image]][npm-url] [![Build Status][test-image]][test-url] [![Coverage Status][coverage-image]][coverage-url] <!-- [![dependencies][dependencies-image]][dependencies-url] -->

> Inverse of [incomplete gamma function][incomplete-gamma-function].

<section class="intro">

Computes the inverse of the lower [incomplete gamma function][incomplete-gamma-function]

<!-- <equation class="equation" label="eq:lower_incomplete_gamma" align="center" raw="P( x, a ) = \frac{\gamma(a,x)}{\Gamma(a)} = \frac{1}{\Gamma(a)} \int_0^x t^{a-1} e^{-t} \; dt" alt="Regularized lower incomplete gamma function."> -->

<div class="equation" align="center" data-raw-text="P( x, a ) = \frac{\gamma(a,x)}{\Gamma(a)} = \frac{1}{\Gamma(a)} \int_0^x t^{a-1} e^{-t} \; dt" data-equation="eq:lower_incomplete_gamma">
    <img src="https://cdn.jsdelivr.net/gh/stdlib-js/stdlib@bb29798906e119fcb2af99e94b60407a270c9b32/lib/node_modules/@stdlib/math/base/special/gammaincinv/docs/img/equation_lower_incomplete_gamma.svg" alt="Regularized lower incomplete gamma function.">
    <br>
</div>

<!-- </equation> -->

Specifically, for given `p` and `a` it finds the `x` such that `p =  P(x, a)`.

The function can also be used to invert the upper incomplete gamma function, which is defined as follows:  

<!-- <equation class="equation" label="eq:upper_incomplete_gamma" align="center" raw="Q( x, a ) = \frac{\Gamma(a,x)}{\Gamma(a)} = \frac{1}{\Gamma(a)} \int_x^\infty t^{a-1} e^{-t} \; dt" alt="Regularized upper incomplete gamma function."> -->

<div class="equation" align="center" data-raw-text="Q( x, a ) = \frac{\Gamma(a,x)}{\Gamma(a)} = \frac{1}{\Gamma(a)} \int_x^\infty t^{a-1} e^{-t} \; dt" data-equation="eq:upper_incomplete_gamma">
    <img src="https://cdn.jsdelivr.net/gh/stdlib-js/stdlib@bb29798906e119fcb2af99e94b60407a270c9b32/lib/node_modules/@stdlib/math/base/special/gammaincinv/docs/img/equation_upper_incomplete_gamma.svg" alt="Regularized upper incomplete gamma function.">
    <br>
</div>

<!-- </equation> -->

Again, for given `p` and `a` the function returns the `x` which satisfies `p = Q(x, a)`.

</section>

<!-- /.intro -->



<section class="usage">

## Usage

To use in Observable,

```javascript
gammaincinv = require( 'https://cdn.jsdelivr.net/gh/stdlib-js/math-base-special-gammaincinv@umd/browser.js' )
```

To vendor stdlib functionality and avoid installing dependency trees for Node.js, you can use the UMD server build:

```javascript
var gammaincinv = require( 'path/to/vendor/umd/math-base-special-gammaincinv/index.js' )
```

To include the bundle in a webpage,

```html
<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/stdlib-js/math-base-special-gammaincinv@umd/browser.js"></script>
```

If no recognized module system is present, access bundle contents via the global scope:

```html
<script type="text/javascript">
(function () {
    window.gammaincinv;
})();
</script>
```

#### gammaincinv( p, s\[, upper ] )

Inverts the regularized incomplete gamma function. Contrary to the more commonly used definition, in this implementation the first argument is the probability `p` and the second argument is the scale factor `a`. By default, the function inverts the _lower_ regularized incomplete gamma function, `P(x,a)`. To invert the _upper_ function instead, i.e. `Q(x,a)`, set the `upper` argument to `true`.

```javascript
var y = gammaincinv( 0.5, 2.0 );
// returns ~1.678

y = gammaincinv( 0.1, 10.0 );
// returns ~6.221

y = gammaincinv( 0.75, 3.0 );
// returns ~3.92

y = gammaincinv( 0.75, 3.0, true );
// returns ~1.727
```

If provided `NaN` as any argument, the function returns `NaN`.

```javascript
var y = gammaincinv( NaN, 1.0 );
// returns NaN

y = gammaincinv( 0.5, NaN );
// returns NaN
```

If provided a value outside `[0,1]` for `p`, the function returns `NaN`.

```javascript
var y = gammaincinv( 1.2, 1.0 );
// returns NaN

y = gammaincinv( -0.5, 1.0 );
// returns NaN
```

</section>

<!-- /.usage -->

<section class="examples">

## Examples

<!-- eslint no-undef: "error" -->

```html
<!DOCTYPE html>
<html lang="en">
<body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/stdlib-js/random-base-randu@umd/browser.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/stdlib-js/math-base-special-gammaincinv@umd/browser.js"></script>
<script type="text/javascript">
(function () {

var a;
var i;
var p;

for ( i = 0; i < 100; i++ ) {
    p = randu();
    a = randu() * 50.0;
    console.log( 'p: %d, \t a: %d, \t P^(-1)(p, a): %d', p.toFixed( 4 ), a.toFixed( 4 ), gammaincinv( p, a ).toFixed( 4 ) );
}

})();
</script>
</body>
</html>
```

</section>

<!-- /.examples -->

<!-- Section for related `stdlib` packages. Do not manually edit this section, as it is automatically populated. -->

<section class="related">

* * *

## See Also

-   <span class="package-name">[`@stdlib/math/base/special/gamma`][@stdlib/math/base/special/gamma]</span><span class="delimiter">: </span><span class="description">gamma function.</span>
-   <span class="package-name">[`@stdlib/math/base/special/gamma1pm1`][@stdlib/math/base/special/gamma1pm1]</span><span class="delimiter">: </span><span class="description">compute gamma(x+1) - 1.</span>
-   <span class="package-name">[`@stdlib/math/base/special/gammainc`][@stdlib/math/base/special/gammainc]</span><span class="delimiter">: </span><span class="description">incomplete gamma function.</span>
-   <span class="package-name">[`@stdlib/math/base/special/gammaln`][@stdlib/math/base/special/gammaln]</span><span class="delimiter">: </span><span class="description">natural logarithm of the gamma function.</span>

</section>

<!-- /.related -->

<!-- Section for all links. Make sure to keep an empty line after the `section` element and another before the `/section` close. -->


<section class="main-repo" >

* * *

## Notice

This package is part of [stdlib][stdlib], a standard library for JavaScript and Node.js, with an emphasis on numerical and scientific computing. The library provides a collection of robust, high performance libraries for mathematics, statistics, streams, utilities, and more.

For more information on the project, filing bug reports and feature requests, and guidance on how to develop [stdlib][stdlib], see the main project [repository][stdlib].

#### Community

[![Chat][chat-image]][chat-url]

---

## License

See [LICENSE][stdlib-license].


## Copyright

Copyright &copy; 2016-2023. The Stdlib [Authors][stdlib-authors].

</section>

<!-- /.stdlib -->

<!-- Section for all links. Make sure to keep an empty line after the `section` element and another before the `/section` close. -->

<section class="links">

[npm-image]: http://img.shields.io/npm/v/@stdlib/math-base-special-gammaincinv.svg
[npm-url]: https://npmjs.org/package/@stdlib/math-base-special-gammaincinv

[test-image]: https://github.com/stdlib-js/math-base-special-gammaincinv/actions/workflows/test.yml/badge.svg?branch=main
[test-url]: https://github.com/stdlib-js/math-base-special-gammaincinv/actions/workflows/test.yml?query=branch:main

[coverage-image]: https://img.shields.io/codecov/c/github/stdlib-js/math-base-special-gammaincinv/main.svg
[coverage-url]: https://codecov.io/github/stdlib-js/math-base-special-gammaincinv?branch=main

<!--

[dependencies-image]: https://img.shields.io/david/stdlib-js/math-base-special-gammaincinv.svg
[dependencies-url]: https://david-dm.org/stdlib-js/math-base-special-gammaincinv/main

-->

[chat-image]: https://img.shields.io/gitter/room/stdlib-js/stdlib.svg
[chat-url]: https://gitter.im/stdlib-js/stdlib/

[stdlib]: https://github.com/stdlib-js/stdlib

[stdlib-authors]: https://github.com/stdlib-js/stdlib/graphs/contributors

[umd]: https://github.com/umdjs/umd
[es-module]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules

[deno-url]: https://github.com/stdlib-js/math-base-special-gammaincinv/tree/deno
[umd-url]: https://github.com/stdlib-js/math-base-special-gammaincinv/tree/umd
[esm-url]: https://github.com/stdlib-js/math-base-special-gammaincinv/tree/esm
[branches-url]: https://github.com/stdlib-js/math-base-special-gammaincinv/blob/main/branches.md

[stdlib-license]: https://raw.githubusercontent.com/stdlib-js/math-base-special-gammaincinv/main/LICENSE

[incomplete-gamma-function]: https://en.wikipedia.org/wiki/Incomplete_gamma_function

<!-- <related-links> -->

[@stdlib/math/base/special/gamma]: https://github.com/stdlib-js/math-base-special-gamma/tree/umd

[@stdlib/math/base/special/gamma1pm1]: https://github.com/stdlib-js/math-base-special-gamma1pm1/tree/umd

[@stdlib/math/base/special/gammainc]: https://github.com/stdlib-js/math-base-special-gammainc/tree/umd

[@stdlib/math/base/special/gammaln]: https://github.com/stdlib-js/math-base-special-gammaln/tree/umd

<!-- </related-links> -->

</section>

<!-- /.links -->
