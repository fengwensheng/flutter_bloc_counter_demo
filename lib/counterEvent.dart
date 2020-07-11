/*
 * @Author: Vincent Feng 
 * @Date: 2020-07-11 12:08:29 
 * @Last Modified by: Vincent Feng
 * @Last Modified time: 2020-07-11 12:12:03
 */

/// base type of all events
abstract class CounterEvent {}

/// --
class DecrementCounterEvent extends CounterEvent {}

/// ++
class IncrementCounterEvent extends CounterEvent {}
