// RUN: %target-parse-verify-swift

class C {
	var x = 0;
}
class D: C {}

var c1 = C()
c1.x = 1

var d1 = D()
d1.x = 2

// Array<T>
var ca: Array<C> = [c1]
var da: Array<D> = [d1]

ca = da
da = ca // expected-error{{cannot assign value of type 'Array<C>' to type 'Array<D>'}}

var caa = [ca]
var daa = [da]

caa = daa // expected-error{{cannot assign value of type '[Array<D>]' to type '[Array<C>]'}}

// Array slice type
var cas: [C] = [c1]
var das: [D] = [d1]

cas = das
das = cas // expected-error{{cannot assign value of type '[C]' to type '[D]'}}

// ArraySlice<T>
var cs = ca[0...0]
var ds = da[0...0]

cs = ds // expected-error{{cannot assign value of type 'ArraySlice<D>' to type 'ArraySlice<C>'}}
ds = cs // expected-error{{cannot assign value of type 'ArraySlice<C>' to type 'ArraySlice<D>'}}

// ContiguousArray<T>
var cna: ContiguousArray<C> = [c1]
var dna: ContiguousArray<D> = [d1]

cna = dna // expected-error{{cannot assign value of type 'ContiguousArray<D>' to type 'ContiguousArray<C>'}}
dna = cna // expected-error{{cannot assign value of type 'ContiguousArray<C>' to type 'ContiguousArray<D>'}}
