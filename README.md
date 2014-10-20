
# A brief look at Rubinius JIT performance

I was reading
[The overhead of abstraction in C/C++ vs.  Python/Ruby](http://blog.reverberate.org/2014/10/the-overhead-of-abstraction-in-cc-vs.html)
over the weekend. The main point is that Abstractions should not have a high
cost. I implemented the sample in Ruby and used Rubinius to get some nice results.

Rubinius with its JIT does an excellent job of keep abstraction costs down. 


## Looping 100,000,000 times

### Using Rubinius & Ruby benchmark

```
% rbx t.rb
       user     system      total        real
simple loop  9.546382   0.009865   9.556247 (  9.552078)
abstraction  9.656119   0.011215   9.667334 (  9.633378)
[5000000050000000, 5000000050000000]
```

## Looping 100,000,000 times

### Rubinius 2.2.10


```
% time rbx t1.rb 
[5000000050000000]
9.619u 0.393s 0:10.21 97.9% 0+0k 359+30io 1634pf+0w
% time rbx t2.rb
[5000000050000000]
9.442u 0.081s 0:09.47 100.5%  0+0k 2+6io 34pf+0w
```

### MRI

```
% time /usr/bin/ruby t1.rb && time /usr/bin/ruby t2.rb
[5000000050000000]
7.251u 0.012s 0:07.26 100.0%  0+0k 0+0io 0pf+0w
[5000000050000000]
13.829u 0.012s 0:13.85 99.8%  0+0k 0+0io 0pf+0w
```


## Looping 1,000,000,000 times

### Rubinius

```
% time rbx t1.rb&& time rbx t2.rb 
[500000000500000000]
92.919u 0.121s 1:33.10 99.9%  0+0k 0+3io 0pf+0w
[500000000500000000]
89.970u 0.117s 1:30.12 99.9%  0+0k 0+6io 0pf+0w
```

### MRI

```
% time /usr/bin/ruby t1.rb && time /usr/bin/ruby  t2.rb
[500000000500000000]
74.921u 0.092s 1:15.09 99.8%  0+0k 37+13io 277pf+0w
[500000000500000000]
136.280u 0.071s 2:16.46 99.9% 0+0k 0+0io 0pf+0w
```

