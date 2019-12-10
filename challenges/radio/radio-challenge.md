# Challenge: Radio 📻

This challenge's aim is to create a radio in Ruby. It doesn't need to play any music like a real radio but it will be instantiated from a `Radio` class.

The `Radio` will have controls for the volume, radio frequency and band (AM/FM).

To solve this challenge, instance attributes and methods as well as class attributes and methods should be used.

## Part 1

The first step is to get the basics of the Radio working. This would be volume in this case.
Use a `@volume` instance variable along with read and write methods. It also should have a status method that returns the current volume in string form. For instance, `"volume: 10"`.

Volume should not go above 10 or less than 1.

To recap include these in the class:

- `Radio#volume`
- `Radio#volume=`
- `Radio#status`

## Part 2

Write an `initialize` method that will set sensible defaults to each `Radio` instance. For frequency, use `freq` (for short) when naming any variables or methods.

In the `Radio#initialize` method, set a default `frequency`, making sure the values always stay inside an allowed range.

When using an FM radio the range would be anywhere from `88.0` to `108.0`.

When using an AM radio, the range would be `540.0` to `1600.0`. The frequency range will be dealt in [`Floats`](https://github.com/csalmeida/ruby-fundamentals#notes-on-floats).

This will require a `band` value and that the `Radio` is set to one of those when initialized. This value can be read but not changed from outside the class.

A band specific radio can be created using `Radio.am` or `Radio.fm` respectively.

Modify the `Radio#status` method to return not only the `volume` but also the frequency and `band`. For example, `"station: 88.5 FM, volume 8"`.

## Part 3

Make sure your Ruby script files are organized according to best practices and an `init.rb` is used.

Test the following:

1. `fm - Radio.fm` created an FM radio with no errors.
1. `puts fm.status` prints the status of the radio including volume, frequency and band.
1. `fm.volume = 8` will set the volume of the radio
1. Setting the volume to `12` does not work as it is larger than `10`.
1. Setting the volume to `-2` does not work as it is lower than `1`.
1. `fm.freq = 85.5` should not work as it falls out of the FM band.
1. `fm.freq = 88.5` should set the frequency to that value.
1. `fm.band` should return the band of this radio.
1. `fm.band = "none"` should not work as `band` is read only.
1. The same steps should work for an `Radio.am` radio.

## Extra tasks

The program can optionally be extended:

- Allow changing the radio band, the `Radio` class is currently designed to instantiate one or the other so it will require a few changes.
- A `switch_band` method might be helpful to handle logic when changing bands can keeping the frequency range correct.
- When switching bands the last frequency used could be remembered when switching over, instead of defaults.
- Create a separate `Tuner` class and add all frequency related logic to it. then a `Radio` would instantiate its `Tuner` to handle changing stations.
- For example `radio.tuner.freq` and `radio.tuner.freq = 101.1`.