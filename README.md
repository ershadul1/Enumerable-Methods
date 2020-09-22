# Enumerable-Methods

This project contains selfmade enumerable methods such as
- my_each
- my_each_with_index
- my_select
- my_count
- my_all?
- my_any?
- my_none?
- my_map
- my_inject

## Requirements

- Ruby (2.7.1)
 
## Live Demo

[Live Demo Link](https://repl.it/join/ianlrxsb-ershadul)
​

## Getting Started

To get a local copy of the repository please run the following commands on your terminal:

```
git clone git@github.com:ershadul1/Enumerable-Methods.git
cd Enumerable-Methods
```


## Usage

```
[1, 2, 3].my_each { |i| i > 2 }                            # => 3
[1, 2, 3].my_each_with_index { |item, index| puts index }  # => 0 1 2
[5, 4, 1].my_select { |i| i == 4 }                         # => [4]
%w[ant bear cat].my_all? { |word| word.length >= 4 }       # => false
[nil, true, 99].my_any?(Integer)                           # => true
[nil, false, true].my_none?                                # => false
[1, 3, 5].my_count { |i| i > 1 }                           # => 2
(1..4).my_map { |i| i*i }                                  # => [1, 4, 9, 16]
(5..10).my_inject { |sum, n| sum + n }                     # => 45
```

## Authors

👤 **Maryjane**

- Github: [@maryjane](https://github.com/maryjanee)

- Twitter: [@AlfredMaryjane](https://twitter.com/AlfredMaryjane)

- Linkedin: [Maryjane Akpagbue](https://www.linkedin.com/in/maryjane-akpagbue-1500b7173/)

👤 **Rayhan**
​
- Github: [@ershadul1](https://github.com/ershadul1)

- Twitter: [@ErshadulRayhan](https://twitter.com/ErshadulRayhan)

- Linkedin: [ErshadulRayhan](https://www.linkedin.com/in/ershadulrayhan/)

- Email:  ershadul.rayhan@gmail.com
  ​

## Contributing

- To contribute to this project:
- Fork this repository & clone locally.
- Create an upstream remote and sync your local copy.
- create a new branch.
- Push your code to your origin repository.
- Create a new Pull Request .

## Show your support

Give a ⭐️ if you like this project!
​

## Acknowledgments

- Microverse
- The Odin Project
