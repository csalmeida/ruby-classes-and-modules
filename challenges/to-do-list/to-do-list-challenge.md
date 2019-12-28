# Challenge: To-do List ✍️

This challenge is meant to focus on applying knowledge around Ruby's modules.

1. Define a `ToDoList` class.

> 

2. Mix in Ruby's built-in module `Enumerable`. Many objects make use of this module such as `Array`, `Hash` and `Range`, however it is not limited to Ruby's use and can be used in `ToDoList`.

The custom `ToDoList` class will inherit all methods defined in `Enumerable` including `#map`, `#find`, `#count` and others that are helpfull when dealing with lists.

However, `Enumerable` can only be mixed in if the `#each` method is define within the class. For that please use the following snippet:

```ruby
# To use Enumerable as a mixin, a class must define #each.
def each
  @items.each {|item| yield(item)}
end
```

3. Allow an instance of a list to be created, with each item being a list. A list may be initialized with a few items, passed in as an array:

```ruby
list = ToDoList.new(['dishes', 'nap', 'laundry', 'vaccum'])
```

4. Items can be returned with `list#items` being an attribute reader only.

5. The first item can be returned with `list.first`.

6. Define `ToDoList#<<` so that it adds a new item to the **front** of `@items` when `list << 'sweep'` is called.

## Further Notes

The structure of the project should be similar to the one below:

```
.
└── to-do-list
    ├── classes
    │   └── to_do_list.rb
    └── init.rb
```

This challenge already includes an `init.rb` file as a starting point since the assignment is the creation of the `ToDoList` class itself. `init.rb` may be used to understand if the class works as expected.