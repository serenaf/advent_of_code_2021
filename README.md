Day 1

Lessons learned:
Beware of the famous of by 1 errors.

Have a closer look at each_cons again. Try to understand Dario's solution

```
input = File.open("input").readlines.map(&:chomp).map(&:to_i)
input.each_cons(2).map { |a, b| b > a ? 1 : 0 }.sum
```

```
input.each_cons(3).map(&:sum).each_cons(2).map { |a, b| b > a ? 1 : 0 }.sum
```
