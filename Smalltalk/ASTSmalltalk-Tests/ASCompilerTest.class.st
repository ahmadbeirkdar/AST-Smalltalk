Class {
	#name : #ASCompilerTest,
	#superclass : #TestCase,
	#category : #'ASTSmalltalk-Tests-Tests'
}

{ #category : #asserting }
ASCompilerTest >> assertEquivalent: anObject [ 
	| result |
	result := ASCompiler new statementForTest: anObject printString.
	self assert: result baseValue equals: anObject.

]

{ #category : #tests }
ASCompilerTest >> testCascade [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#cascade.
	self assert: method arguments equals: #().
	self assert: method selector equals: #cascade.
	self assert: method scope asArray equals: #(foo).
	self assert: method statements size equals: 17.

]

{ #category : #tests }
ASCompilerTest >> testGives43 [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#gives43.
	self assert: method arguments equals: #().
	self assert: method selector equals: #gives43.
	self assert: method scope asArray equals: #(forty2).
	self assert: method statements size equals: 2.

]

{ #category : #tests }
ASCompilerTest >> testOr [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#|.
	self assert: method arguments equals: #(n1).
	self assert: method selector equals: #|.
	self assert: method scope asArray equals: #(n1 temp).
	self assert: method statements size equals: 2.

]

{ #category : #tests }
ASCompilerTest >> testOrOr [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#||.
	self assert: method arguments equals: #(n1).
	self assert: method selector equals: #||.

]

{ #category : #tests }
ASCompilerTest >> testPlus [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#+.
	self assert: method arguments equals: #(n1).
	self assert: method selector equals: #+.

]

{ #category : #tests }
ASCompilerTest >> testPlus1 [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#plus1:.
	self assert: method arguments equals: #(aNumber).
	self assert: method selector equals: #plus1:.

]

{ #category : #tests }
ASCompilerTest >> testPlusAndAnd [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#plus:and:and:.
	self assert: method arguments equals: #(n1 n2 n3).
	self assert: method selector equals: #plus:and:and:.

]

{ #category : #tests }
ASCompilerTest >> testSimple1 [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#simple1.
	self assert: method arguments equals: #().
	self assert: method selector equals: #simple1.

]

{ #category : #tests }
ASCompilerTest >> testStatements [
	self assertEquivalent: 42.
	self assertEquivalent: #hello.
	self assertEquivalent: 'abc'.
	self assertEquivalent: nil.
	self assertEquivalent: #( 1 (2 3) #(nil #nil)).

]

{ #category : #tests }
ASCompilerTest >> testUnaries [
	| method |
	method := ASCompiler new compileMethod: ASCompileTestClass1>>#unaries.
	self assert: method arguments equals: #().
	self assert: method selector equals: #unaries.

]
