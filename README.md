# Data Structures

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![ruby](https://img.shields.io/badge/ruby-2.7.1-dc143c)

## Getting Started

### Install Dependencies

``` bash
bundle install
```

### Run Tests

``` bash
rake test
```

## Classes and Methods

### Stack

#### Adds element
``` ruby
push(element)
```

#### Removes element
``` ruby
pop
```

#### Returns the top element
``` ruby
top
```

### Queue

#### Adds element
``` ruby
enqueue(element)
```

#### Removes element
``` ruby
dequeue
```

#### Returns the top element
``` ruby
front
```

### List

#### Adds element to the end of the list
``` ruby
append(element)
```

#### Adds element at the beginning of the list
``` ruby
prepend(element)
```

#### Adds element in determined index
``` ruby
insert_at(element, index)
```

#### Removes element by index
``` ruby
remove_at(index)
```

#### Removes first element
``` ruby
remove(element)
```

#### Removes all elements
``` ruby
clean
```

#### Returns the first element
``` ruby
first
```

#### Returns the last element
``` ruby
last
```

#### Returns the index of first element
``` ruby
index_at(element)
```

#### Returns element by index
``` ruby
get(index)
```

#### Sets the element at index
``` ruby
set(element, index)
```

#### Inverts the list order
``` ruby
revert
```

#### Returns true if the given element is present in list, otherwise returns false
``` ruby
include?(element)
```

#### Returns the size of list
``` ruby
size
```

#### Returns true if list contains no elements, otherwise returns false
``` ruby
empty?
```

