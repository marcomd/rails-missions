# CHANGELOG

## mission2 - Added Fibonacci model 21/10/2022

- Added Fibonacci model
- The controller Fibonacci#create now adds a new record to Fibonacci table
- The mission2 is now completed

## mission1 - Fibonacci controller now return a real result 21/10/2022

- Fibonacci POST requests now involve fibonacci service
  - Fibonacci POST requests now involve the fibonacci service to return the result of the algorithm
    Previously a fake result was returned.
  - The mission1 is now completed

## mission1 - Added fibonacci algorithm service 21/10/2022

- Added service that applies fibonacci algorithm
- Added simple command gem to standardize and make simpler the use of services

## mission1 - Controller created 21/10/2022

- The controllers fibonacci is created
  - Added the route api/v1/post/fibonacci responding with POST
  - Added the base and fibonacci controller
  - Added request and controller specs

## mission1 - Initial configuration 21/10/2022

- Bundle and first commit
  - rail, rspec and everything else is working