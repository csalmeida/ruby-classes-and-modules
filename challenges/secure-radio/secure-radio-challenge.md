Challenge: Secure Radio 📻🔒

This challenge is to create a secure radio, which return an encrypted audio stream.

# Part 1

To achieve this, make use of the `Radio` class from the previous challenge and add a `Radio#play` to it which returns a fake audio stream as a string value.

Add an `@@audio_samples` class attribute array with examples of streams to `Radio`, here's an example:

```ruby
  @@audio_samples = [
    "Here Comes the Sun",
    "Like a Rolling Stone",
    "Cantaloupe Island",
    "a traffic report",
    "a news report"
  ]
```

Create a private `Radio#audio_stream` method where a random element of `@@audio_samples` is returned. The [`Array#sample` method](https://ruby-doc.org/core-2.6.5/Array.html#method-i-sample) could be used here.

Edit or create `Radio#play` to return the `Radio#audio_stream`. For, example: `puts "The radio plays: " + audio_stream`.

# Part 2

Use [a shift cipher](https://goto.pachanka.org/crypto/shift-cipher) to encrypt the stream string. A shift cipher replaces each characters with a letter, a fixed number of positions down the alphabet.

In the example below a shift of `3` is applied so `A` will become `D`.

```bash
With a shift of 3: A => D, B => E, C => F, D => G
```

Create a `ShiftCipher` class to be used when encrypted the stream.

Add a `ShiftCipher.encode(plain_string, 3)` class method that encrypts the strings. It takes a plain string, in this case, it would be the `SecureRadio#audio_stream`, and an `integer` of how much a character should be shifted by.

Create a `ShiftCipher.decode(cipher_string, 3)` method that will revert an encrypted string to its original state. It should take the same number of arguments as `ShiftCipher.encode`.

Technically, the secure radio would only broadcast encrypted streams and would be up to the listener to decode it, however it is a good exercise to write both of them.

### Hints


<details>
<summary>Click to expand contents</summary>
  
  - When an array of letters is needed, `[*a..z]` can be used to spread letters from `'a'` to `'z'` into an array.
  - There are a variety of ways to write the shift cipher code, but the following methods can be useful when doing it: 
    - `Array#map`
    - `Array#include?`
    - `Array#find_index`
    - `Array#join`
  - A good start might be starting by shifting lowercase strings with `String#downcase` before trying to work out how to encrypt mixed cased strings.
  - The modulo operator might be useful to keep the shift from happening with a letter at the end of the alphabet. `28 % 26 returns 2`
</details>

# Part 3

Create a `SecureRadio` subclass which inherits from `Radio` and makes use of `ShiftCipher` to encrypt the audio stream.

<details open>
<summary>Click to expand contents</summary>
  
  - Use inheritance.
  - Remember method access control: `protected`, `private`. Protected makes methods available for its class and subclass but private does not.
  - Try to use `super` after you override a method.
</details>
<br>

