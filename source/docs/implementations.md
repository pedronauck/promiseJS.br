## Implementações

Essa página lista algumas das mais populares maneiras de implementar Promises. O Promise é meu, por isso vem em primeiro lugar. Q é meu favorito feito por outras pessoas, por isso vem em segundo lugar. I não tenho usado as outras implementações aqui, mas eles são relativamente populares.implementations here but they seem relatively popular.

As Promises/A+ mantém uma lista completa de implementações [aqui](https://github.com/promises-aplus/promises-spec/blob/master/implementations.md), olhe caso você queira ter mais escolhas.

## <a name="promises"></a> Promise

Promise, por Forbes Lindesay, é uma simples e performática library para promise. Ela é desenhada para somente prover o esqueleto necessário para usar promises na sua selva.

Se você usa node.js ou browserify, você pode insta-lo usando npm:

```language-javascript
npm install promise
```

e depois loadar usando require:

```language-javascript
var Promise = require('promise')
```

Se você está usando qualquer outro sistema de modulos ou quer loadar diretamente no browser, você pode baixar uma versão com uma definição de módulo standalone por [aqui](http://www.promisejs.org/implementations/promise/promise-3.2.0.js) (com suporte [UMD](https://github.com/ForbesLindesay/umd)) ou adicionar um tag ```<script>``` diretmente:

```language-javascript
<script src="http://www.promisejs.org/implementations/promise/promise-3.2.0.js"></script>
```

Uma vez instalado, você pode criar uma promise usando:

```language-javascript
var myPromise = new Promise(function (resolve, reject) {
  // call resolve(value) to fulfill the promise with that value
  // call reject(error) if something goes wrong
})
```

A documentação completa pode ser encontrada em [https://github.com/then/promise](https://github.com/then/promise).

## <a name="q"></a> Q

Q, por Kris Kowal, é uma avançada e completa library para promise. Ela foi desenhada para ser completa e ter uma série de metódos auxiliares para fazer certas tarefas comuns serem fáceis. Ela é um pouco mais devagar que o Promise, mas pode compensar por ter melhor suporte para stacks trackes e features adicionais.

Se você usa node.js ou browserify, você pode insta-lo usando npm:

```language-javascript
npm install q
```

e depois loadar usando require:

```language-javascript
var Q = require('q')
```

Se você está usando qualquer outro sistema de modulos ou quer loadar diretamente no browser, você pode baixar uma versão com uma definição de módulo standalone por [aqui](http://www.promisejs.org/implementations/promise/promise-3.2.0.js) (com suporte [UMD](https://github.com/ForbesLindesay/umd)) ou adicionar um tag ```<script>``` diretmente:

```language-javascript
<script src="http://www.promisejs.org/implementations/q/q-0.9.6.js"></script>
```

Uma vez instalado, você pode criar uma promise usando:

```language-javascript
var myPromise = Q.promise(function (resolve, reject) {
  // call resolve(value) to fulfill the promise with that value
  // call reject(error) if something goes wrong
})
```

A documentação completa pode ser encontrada em [https://github.com/kriskowal/q](https://github.com/kriskowal/q)

## <a name="when"></a> When

Uma sólida, Promises/A+ rápida e implementação when(), mais outras boas coisas assíncronas.

Se você usa node.js ou browserify, você pode insta-lo usando npm:

```language-javascript
npm install when
```

e depois loadar usando require:

```language-javascript
var when = require('when');
```

Se você está usando qualquer outro sistema de modulos ou quer loadar diretamente no browser, você pode baixar uma versão com uma definição de módulo standalone por [aqui](http://www.promisejs.org/implementations/promise/promise-3.2.0.js) (com suporte [UMD](https://github.com/ForbesLindesay/umd)) ou adicionar um tag ```<script>``` diretmente:

```language-javascript
<script src="http://www.promisejs.org/implementations/when/when-2.2.1.js"></script>
```

Uma vez instalado, você pode criar uma promise usando:

```language-javascript
var deferred = when.defer()
var myPromise = deferred.promise
// call deferred.resolve(value) to fulfill the promise with that value
// call deferred.reject(error) if something goes wrong
```

A documentação completa pode ser encontrada em [https://github.com/cujojs/when/wiki](https://github.com/cujojs/when/wiki).

## <a name="rsvp.js"></a> rsvp.js
Uma implementação minúscula de Promises/A+ e um mixin para transformar objetos em event targets.

Se você usa node.js ou browserify, você pode insta-lo usando npm:

```language-javascript
npm install rsvp
```

e depois loadar usando require:

```language-javascript
var RSVP = require('rsvp');
```

Se você está usando qualquer outro sistema de modulos ou quer loadar diretamente no browser, você pode baixar uma versão com uma definição de módulo standalone por [aqui](http://www.promisejs.org/implementations/promise/promise-3.2.0.js) (com suporte [UMD](https://github.com/ForbesLindesay/umd)) ou adicionar um tag ```<script>``` diretmente:

```language-javascript
<script src="http://www.promisejs.org/implementations/rsvp/rsvp-2.0.1.js"></script>
```

Uma vez instalado, você pode criar uma promise usando:

```language-javascript
var deferred = when.defer()
var myPromise = deferred.promise
// call deferred.resolve(value) to fulfill the promise with that value
// call deferred.reject(error) if something goes wrong
```

A documentação completa pode ser encontrada em [https://github.com/tildeio/rsvp.js](https://github.com/tildeio/rsvp.js).

## <a name="vow"></a> Vow
Uma implementação de Promises/A+.

Se você usa node.js ou browserify, você pode insta-lo usando npm:

```language-javascript
npm install vow
```

e depois loadar usando require:

```language-javascript
var Vow = require('vow');
```

Se você está usando qualquer outro sistema de modulos ou quer loadar diretamente no browser, você pode baixar uma versão com uma definição de módulo standalone por [aqui](http://www.promisejs.org/implementations/promise/promise-3.2.0.js) (com suporte [UMD](https://github.com/ForbesLindesay/umd)) ou adicionar um tag ```<script>``` diretmente:

```language-javascript
<script src="http://www.promisejs.org/implementations/vow/vow-0.3.9.js"></script>
```

Uma vez instalado, você pode criar uma promise usando:

```language-javascript
var myPromise = new RSVP.Promise(function (resolve, reject) {
  // call resolve(value) to fulfill the promise with that value
  // call reject(error) if something goes wrong
})
```

A documentação completa pode ser encontrada em [https://github.com/dfilatov/jspromise](https://github.com/dfilatov/jspromise).
