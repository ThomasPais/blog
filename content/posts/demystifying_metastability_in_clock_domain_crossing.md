+++
title = "Demystifying metastability in clock domain crossing"
description = "When dealing with clock domain crossing, metastability can occur. This post explains what it is and how to mitigate it."
date = 2026-11-01
updated = 2026-12-01
draft = true
[taxonomies]
tags = ["vhdl", "hardware"]
[extra]
math = true
+++

## What is metastability?

Metastability occurs when a flip-flop's output remains in an indeterminate state for an extended period due to the propagation delay of the clock signal. This can lead to unpredictable behavior in the circuit.

Metastability is a probabilistic issue with the probability of occurrence being influenced by factors such as clock skew, setup and hold times, and the propagation delay of the clock signal.

### Setup and hold times

Timing setup and hold times what is it and link with metastability

$$Meta formula$$

## How to mitigate metastability?

To mitigate metastability, several techniques can be employed:

### Double Flip-Flop synchronization

One common technique is to use double flip-flop synchronization. This involves using two flip-flops in series to synchronize data between clock domains. The first flip-flop captures the data at the source clock domain, while the second flip-flop latches the data at the destination clock domain.

TODO SCHEMA EXPLAINING

SIMULATION

This circuit can be implemented using VHDL as follows:

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity double_flop_synchronizer is
  port (
    --! Clock signal for the destination clock domain
    i_clk  : in std_logic;
    --! Synchronous reset signal (active high)
    i_rst  : in std_logic;
    --! Input data from an asynchronous clock domain
    i_data : in std_logic;
    --! Output data signal synchronized to i_clk
    o_data : out std_logic
  );
end entity double_flop_synchronizer;

architecture rtl of double_flop_synchronizer is
  --! First stage flip-flop to capture asynchronous input
  signal meta   : std_logic;
  --! Second stage flip-flop to provide a stable output
  signal stable : std_logic;

begin
  o_data <= stable;

  --! \brief Synchronization process.
  --! \details On every rising edge of i_clk, the data is shifted through the
  --! 'meta' and 'stable' registers.
  p_sync : process (i_clk)
  begin
    if rising_edge(i_clk) then
      if i_rst = '1' then
        meta   <= '0';
        stable <= '0';
      else
        meta   <= i_data;
        stable <= meta;
      end if;
    end if;
  end process p_sync;

end architecture rtl;
```

### Fast pulse

The signal from the clock domain A is synchronized to clock domain B using a double flip-flop synchronizer but if the pulse is too fast, it may not be captured correctly.

SIMULATION

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_synchronizer is
  port (
    --! Clock domain A
    i_clk_a : in std_logic;
    --! Reset for clock domain A
    i_rst_a : in std_logic;
    --! Clock domain B
    i_clk_b : in std_logic;
    --! Reset for clock domain B
    i_rst_b : in std_logic;
    --! Pulse signal in clock domain A
    i_pulse_a : in std_logic;
    --! Pulse signal synchronized to clock domain B
    o_pulse_b : out std_logic);
end entity pulse_synchronizer;

architecture rtl of pulse_synchronizer is
  --! A simple synchronizer component to synchronize a signal from one clock
  --! domain to another.
  --! This component uses a double flip-flop synchronizer to ensure that the
  --! signal is stable in the target clock domain
  component double_flop_synchronizer
    port (
      i_clk  : in std_logic;
      i_rst  : in std_logic;
      i_data : in std_logic;
      o_data : out std_logic
    );
  end component;

  signal toggle           : std_logic;
  signal toggle_sync      : std_logic;
  signal toggle_sync_pipe : std_logic;
  signal pulse_out        : std_logic;

begin

  --! \brief Toggle the pulse signal in clock domain A
  --! \details This process toggles the input pulse signal from clock domain A
  --! to be able to be synchronized to clock domain B even if the clock A is
  --! faster than clock B.
  p_toggle : process (i_clk_a)
  begin
    if rising_edge(i_clk_a) then
      if i_rst_a = '1' then
        toggle <= '0';
      else
        if i_pulse_a = '1' then
          toggle <= not(toggle);
        end if;
      end if;
    end if;
  end process p_toggle;

  -- Synchronize the toggle signal to clock domain B
  u_sync : double_flop_synchronizer
  port map
  (
    i_clk  => i_clk_b,
    i_rst  => i_rst_b,
    i_data => toggle,
    o_data => toggle_sync);

  o_pulse_b <= pulse_out;

  --! \brief Generate the pulse signal in clock domain B
  --! \details This process generates the pulse signal in clock domain B by
  --! comparing the toggle signal synchronized to clock domain B with the
  --! previous value.
  p_pulse_out : process (i_clk_b)
  begin
    if rising_edge(i_clk_b) then
      if i_rst_b = '1' then
        toggle_sync_pipe <= '0';
        pulse_out        <= '0';
      else
        toggle_sync_pipe <= toggle_sync;
        -- The pulse_out signal is only high when the toggle signal changes
        if toggle_sync /= toggle_sync_pipe then
          pulse_out <= '1';
        else
          pulse_out <= '0';
        end if;
      end if;
    end if;
  end process p_pulse_out;

end architecture rtl;
```
