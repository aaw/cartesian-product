cartesian-product
=================

Ruby's Enumerable.product materializes the entire cartesian product
of a sequence of arrays into an array of arrays, so a call like:

    [(0..100).to_a, (0..100).to_a, (0..100).to_a].reduce(&:product).map(&:flatten)

actually returns an array of a million elements. This module implements
an iterator over the cartesian product of an arbitrary number of arrays,
allowing you to start and stop at a particular index in the lexicographic
ordering without ever representing the cartesian product in memory.

Quick examples:
===============

    >> prod = CartesianProduct.new([1,2], [100,101], ['a','b'])
    >> prod.each { |element| puts element }
    
    [1, 100, 'a']
    [1, 100, 'b']
    [1, 101, 'a']
    [1, 101, 'b']
    [2, 100, 'a']
    [2, 100, 'b']
    [2, 101, 'a']
    [2, 101, 'b']

    >> prod.each(0, 2) { |element| puts element }
    
    [1, 100, 'a']
    [1, 100, 'b']
    
    >> prod.each(4, 7) { |element| puts element }
    
    [2, 100, 'a']
    [2, 100, 'b']
    [2, 101, 'a']
    
    >> prod.each(-3, -1) { |element| puts element }
    
    [2, 100, 'b']
    [2, 101, 'a']
    [2, 101, 'b']

Installation
============

    gem install cartesian-product