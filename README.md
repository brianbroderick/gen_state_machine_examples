# GenStateMachineExamples

Erlang's [gen_statem](http://erlang.org/documentation/doc-8.0-rc1/doc/design_principles/statem.html) is a powerful, yet arguably complicated, library that implements a state machine. [Gen_state_machine](https://github.com/antipax/gen_state_machine) is an Elixir package that wraps gen_statem.  

This repo consists of a few examples using gen_state_machine.  Currently, it has an example of a switch, a door, and a metered freeway on ramp. 

The on ramp is the closest to a real world implementation. You can think of it as a metaphor for a stream process that batches data by size or time to be sent to a downstream process (i.e. cars entering the freeway when the light turns green)
